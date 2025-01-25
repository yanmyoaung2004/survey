package com.yma.survey.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.yma.survey.utils.DateFormatter;

public class SurveyDAO {

	private DataSource dataSource;

	public SurveyDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public User getDefaultUser() {
		String query = "SELECT * FROM users WHERE user_id = '1'";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					return new User(rs.getLong("user_id"), rs.getString("username"), rs.getString("email"),
							rs.getString("password"), rs.getString("creation_date"));
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return null;
	}

	public List<Survey> getAllSurveys() {
		List<Survey> surveys = new ArrayList<>();
		String query = "SELECT survey_id, title, description, is_public, s.creation_date, end_date, start_date, user_id, username "
				+ "FROM surveys s JOIN users u ON s.creator = u.user_id WHERE s.is_public = TRUE ORDER BY s.creation_date DESC;";

		try (Connection connection = dataSource.getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)) {

			while (rs.next()) {
				try {
					Survey survey = new Survey(rs.getLong("survey_id"), rs.getString("title"),
							rs.getString("description"), new User(rs.getLong("user_id"), rs.getString("username")),
							new Category(), rs.getBoolean("is_public"),
							DateFormatter.formatToCustom(rs.getString("creation_date")), rs.getString("end_date"),
							rs.getString("start_date"));
					survey.setNoOfPeopleCompleted(getCompletedPeople(rs.getLong("survey_id")));
					surveys.add(survey);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveys;
	}
	
	public List<Survey> getAllSurveysByUserId(Long userId) {
		List<Survey> surveys = new ArrayList<>();
		String query = "SELECT survey_id, title, description, is_public, s.creation_date, end_date, start_date, user_id, username "
				+ "FROM surveys s JOIN users u ON s.creator = u.user_id WHERE s.is_public = TRUE ORDER BY s.creation_date DESC;";

		try (Connection connection = dataSource.getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)) {
			while (rs.next()) {
				try {
					Survey survey = new Survey(rs.getLong("survey_id"), rs.getString("title"),
							rs.getString("description"), new User(rs.getLong("user_id"), rs.getString("username")),
							new Category(), rs.getBoolean("is_public"),
							DateFormatter.formatToCustom(rs.getString("creation_date")), rs.getString("end_date"),
							rs.getString("start_date"));
					survey.setNoOfPeopleCompleted(getCompletedPeople(rs.getLong("survey_id")));
					survey.setCompletedByCurrentUser(isCompleted(userId, rs.getLong("survey_id")));
					surveys.add(survey);
		
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveys;
	}
	
	
	private boolean isCompleted(Long userId, Long surveyId) {
		String query = "SELECT * FROM responses r "
				+ "JOIN questions q ON q.question_id = r.question_id WHERE user_id = ? AND survey_id = ?;";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setLong(1, userId);
			preparedStatement.setLong(2, surveyId);
			try (ResultSet rs = preparedStatement.executeQuery()) {
				if (rs.next()) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return false;
	}

	public List<Survey> getAllSurveysById(Long userId) {
		List<Survey> surveys = new ArrayList<>();
		String query = "SELECT survey_id, title, description, is_public, s.creation_date, end_date, start_date, user_id, username "
				+ "FROM surveys s JOIN users u ON s.creator = u.user_id WHERE u.user_id = '" + userId
				+ "' ORDER BY s.creation_date DESC	;";

		try (Connection connection = dataSource.getConnection();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)) {

			while (rs.next()) {
				try {
					Survey survey = new Survey(rs.getLong("survey_id"), rs.getString("title"),
							rs.getString("description"), new User(rs.getLong("user_id"), rs.getString("username")),
							new Category(), rs.getBoolean("is_public"),
							DateFormatter.formatToCustom(rs.getString("creation_date")), rs.getString("end_date"),
							rs.getString("start_date"));
					survey.setNoOfPeopleCompleted(getCompletedPeople(rs.getLong("survey_id")));
					surveys.add(survey);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveys;
	}

	private int getCompletedPeople(Long id) {
		String query = "SELECT count(survey_id) as total FROM survey_users WHERE survey_id = ?;";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setLong(1, id);
			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					return rs.getInt("total");
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return 0;
	}

	public boolean createSurvey(Survey survey, List<Question> questions) {
		String insertSurveySQL = "INSERT INTO surveys (title, description, creator, category_id, is_public, start_date, end_date) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement pStmt = connection.prepareStatement(insertSurveySQL,
						Statement.RETURN_GENERATED_KEYS)) {

			connection.setAutoCommit(false);

			pStmt.setString(1, survey.getTitle());
			pStmt.setString(2, survey.getDescription());
			pStmt.setLong(3, survey.getUser().getId());
			pStmt.setLong(4, survey.getCategory().getCategoryId());
			pStmt.setBoolean(5, survey.getIsPublic());
			pStmt.setString(6, survey.getStartDate().toString());
			pStmt.setString(7, survey.getEndDate().toString());

			int rowAffected = pStmt.executeUpdate();
			if (rowAffected > 0) {
				try (ResultSet rs = pStmt.getGeneratedKeys()) {
					if (rs.next()) {
						long surveyId = rs.getLong(1);
						createQuestions(connection, surveyId, questions);
					}
				}
				connection.commit();
				return true;
			} else {
				connection.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try (Connection connection = dataSource.getConnection()) {
				connection.rollback();
			} catch (SQLException rollbackEx) {
				rollbackEx.printStackTrace();
			}
		}
		return false;
	}

	private void createQuestions(Connection connection, Long surveyId, List<Question> questions) throws SQLException {
		String insertQuestionSQL = "INSERT INTO questions (survey_id, question_text, question_type) VALUES (?, ?, ?)";

		try (PreparedStatement pStmt = connection.prepareStatement(insertQuestionSQL,
				Statement.RETURN_GENERATED_KEYS)) {

			for (Question q : questions) {
				pStmt.setLong(1, surveyId);
				pStmt.setString(2, q.getQuestion());
				pStmt.setString(3, q.getQuestionType() == null ? "Single Choice" : q.getQuestionType());

				int rowAffected = pStmt.executeUpdate();
				if (rowAffected > 0) {
					try (ResultSet rs = pStmt.getGeneratedKeys()) {
						if (rs.next()) {
							long questionId = rs.getLong(1);
							createOptions(connection, questionId, q.getAnswers());
						}
					}
				}
			}
		}
	}

	private void createOptions(Connection connection, Long questionId, List<String> options) throws SQLException {
		String insertOptionSQL = "INSERT INTO options (question_id, option_text) VALUES (?, ?)";

		try (PreparedStatement pStmt = connection.prepareStatement(insertOptionSQL)) {
			for (String option : options) {
				pStmt.setLong(1, questionId);
				pStmt.setString(2, option);
				pStmt.addBatch();
			}
			pStmt.executeBatch();
		}
	}

	public ArrayList<Question> getAllQuestionBySurveyId(Long surveyId) {
		String query = "SELECT * FROM questions WHERE survey_id = ?";
		ArrayList<Question> questions = new ArrayList<Question>();

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setLong(1, surveyId);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					Long questionId = rs.getLong("question_id");
					List<String> options = getQuestionOptions(questionId);
					questions.add(new Question(questionId, rs.getString("question_text"), rs.getString("question_type"),
							options));

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}

	private List<String> getQuestionOptions(Long questionId) {
		List<String> options = new ArrayList<>();
		String query = "SELECT * FROM options WHERE question_id = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setLong(1, questionId);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					options.add(rs.getString("option_text"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return options;
	}

	public Survey getSurveyById(Long surveyId) {
		String query = "SELECT * FROM surveys WHERE survey_id = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {

			preparedStatement.setLong(1, surveyId);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				if (rs.next()) {
					return new Survey(surveyId, rs.getString("title"), rs.getString("description"), new User(),
							new Category(), rs.getBoolean("is_public"), rs.getString("creation_date"),
							rs.getString("start_date"), rs.getString("end_date"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean submitSurvey(ArrayList<Response> responses) {
		String query = "INSERT INTO responses (user_id, question_id, option_id) VALUES (?, ?, ?);";
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
			connection.setAutoCommit(false);
			try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
				for (Response response : responses) {
					preparedStatement.setLong(1, response.getUser().getId());
					preparedStatement.setLong(2, response.getQuestion().getQuestionId());
					preparedStatement.setLong(3, response.getOptionId());

					int rowAffected = preparedStatement.executeUpdate();

					if (rowAffected <= 0) {
						connection.rollback();
						return false;
					}
					preparedStatement.clearParameters();
				}
			}
			connection.commit();
			return true;

		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException rollbackException) {
					System.err.println("Error during rollback: " + rollbackException.getMessage());
					rollbackException.printStackTrace();
				}
			}
			System.err.println("Error while submitting survey: " + e.getMessage());
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException closeException) {
					System.err.println("Error closing connection: " + closeException.getMessage());
					closeException.printStackTrace();
				}
			}
		}

		return false;
	}

	public boolean createSurveyUser(Long surveyId, Long userId) {
		String query = "INSERT INTO survey_users (survey_id, user_id) VALUES (?, ?);";
		try (Connection conneciton = dataSource.getConnection();
				PreparedStatement preaPreparedStatement = conneciton.prepareStatement(query)) {
			preaPreparedStatement.setLong(1, surveyId);
			preaPreparedStatement.setLong(2, userId);
			int success = preaPreparedStatement.executeUpdate();
			if (success > 0)
				return true;
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return false;
	}

	public Long getOptionIdByName(String option, Long questionId) {
		String query = "SELECT * FROM options WHERE option_text = ? AND question_id = ?;";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, option);
			preparedStatement.setLong(2, questionId);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				if (rs.next()) {
					return rs.getLong("option_id");
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return null;
	}

	public ArrayList<Survey> searchSurvey(String search) {
		ArrayList<Survey> surveys = new ArrayList<>();
		String query = "SELECT survey_id, title, description, is_public, s.creation_date, end_date, start_date, user_id, username "
				+ "FROM surveys s JOIN users u ON s.creator = u.user_id "
				+ "WHERE (title LIKE ? OR description LIKE ?)";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			String searchPattern = "%" + search + "%";
			preparedStatement.setString(1, searchPattern);
			preparedStatement.setString(2, searchPattern);

			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					surveys.add(new Survey(rs.getLong("survey_id"), rs.getString("title"), rs.getString("description"),
							new User(rs.getLong("user_id"), rs.getString("username")), new Category(),
							rs.getBoolean("is_public"), DateFormatter.formatToCustom(rs.getString("creation_date")),
							rs.getString("end_date"), rs.getString("start_date")));
				}
			} catch (Exception e) {
				System.err.println("Error while processing result set: " + e.getMessage());
			}
		} catch (SQLException e) {
			System.err.println("Database error: " + e.getMessage());
		}
		return surveys;
	}

	public Long getSurveyIdByQuestionId(Long questionId) {
		String query = "SELECT survey_id FROM questions WHERE question_id = ?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setLong(1, questionId);
			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					return rs.getLong("survey_id");
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0L;
	}

	public ArrayList<ResponseResult> getResponseResult(Long surveyId) {
		ArrayList<ResponseResult> data = new ArrayList<ResponseResult>();
		String query = "SELECT * FROM questions WHERE survey_id = ?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setLong(1, surveyId);
			try (ResultSet rs = preparedStatement.executeQuery()) {
				while (rs.next()) {
					Long questionId = rs.getLong("question_id");
					ArrayList<Option> options = getAllOptions(questionId);
					data.add(new ResponseResult(questionId, rs.getString("question_text"),
							rs.getString("question_type"), options));
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return data;
	}

	private ArrayList<Option> getAllOptions(Long questionId) {
		ArrayList<Option> data = new ArrayList<Option>();
		String query = "SELECT option_id, option_text FROM options WHERE question_id = ? ";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, questionId);
			int totalResponseOption = getAllOptionResponseCount(questionId);
			try (ResultSet rs = ps.executeQuery();) {
				while (rs.next()) {
					int count = getRespondOptionsCount(rs.getLong("option_id"));
					double optionCountPercentage = count / (double) totalResponseOption * 100;
					double roundedPercentage = Math.round(optionCountPercentage * 100.0) / 100.0;
					data.add(
							new Option(rs.getLong("option_id"), rs.getString("option_text"), roundedPercentage, count));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}

	private int getRespondOptionsCount(Long optionId) {
		String query = "SELECT count(*) as COUNT FROM responses r WHERE option_id= ?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, optionId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("COUNT");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	private int getAllOptionResponseCount(Long questionId) {
		String query = "SELECT count(*) as COUNT FROM responses WHERE question_id = ? ";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, questionId);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					return rs.getInt("COUNT");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getSurveyCreated(Long userId) {
		String query = "SELECT count(*) as COUNT FROM surveys WHERE creator = ? ";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, userId);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					return rs.getInt("COUNT");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getSurveyResponses(Long userId) {
		int count = 0;
		String firstQuery = "SELECT * FROM surveys WHERE creator = ?";
		String secondQuery = "SELECT * FROM questions WHERE survey_id = ?";
		String thirdQuery = "SELECT COUNT(*) AS COUNT FROM responses WHERE question_id = ?";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(firstQuery)) {

			ps.setLong(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Long surveyId = rs.getLong("survey_id");
					try (PreparedStatement ps1 = connection.prepareStatement(secondQuery)) {
						ps1.setLong(1, surveyId);
						try (ResultSet rs1 = ps1.executeQuery()) {
							while (rs1.next()) {
								Long questionId = rs1.getLong("question_id");
								try (PreparedStatement ps2 = connection.prepareStatement(thirdQuery)) {
									ps2.setLong(1, questionId);
									try (ResultSet rs2 = ps2.executeQuery()) {
										if (rs2.next()) {
											count += rs2.getInt("COUNT");
										}
									}
								}
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getSurveyResponsesByAnonymous(Long userId) {
		int count = 0;
		String firstQuery = "SELECT * FROM surveys WHERE creator = ?";
		String secondQuery = "SELECT * FROM questions WHERE survey_id = ?";
		String thirdQuery = "SELECT COUNT(*) AS COUNT FROM responses WHERE question_id = ? AND user_id = 1";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(firstQuery)) {

			ps.setLong(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					Long surveyId = rs.getLong("survey_id");
					try (PreparedStatement ps1 = connection.prepareStatement(secondQuery)) {
						ps1.setLong(1, surveyId);
						try (ResultSet rs1 = ps1.executeQuery()) {
							while (rs1.next()) {
								Long questionId = rs1.getLong("question_id");
								try (PreparedStatement ps2 = connection.prepareStatement(thirdQuery)) {
									ps2.setLong(1, questionId);
									try (ResultSet rs2 = ps2.executeQuery()) {
										if (rs2.next()) {
											count += rs2.getInt("COUNT");
										}
									}
								}
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getActiveSurvey(long userId) {
		String query = "SELECT COUNT(*) AS active_count FROM surveys WHERE creator = ? AND NOW() < start_date";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("active_count");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Integer> getResponseForChart() {
		List<Integer> data = new ArrayList<>();
		List<String> lastSixDays = getLastSixDays();
		String query = "SELECT COUNT(*) AS COUNT FROM responses WHERE DATE(response_date) = ?";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {

			for (String day : lastSixDays) {
				ps.setString(1, day);
				try (ResultSet rs = ps.executeQuery()) {
					if (rs.next()) {
						data.add(rs.getInt("COUNT"));
					} else {
						data.add(0);
					}
				}
			}
		} catch (SQLException e) {
			System.err.println("SQL error occurred: " + e.getMessage());
		}

		return data;
	}

	private List<String> getLastSixDays() {
		List<String> daysList = new ArrayList<>();
		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		for (int i = 5; i >= 0; i--) {
			LocalDate pastDate = currentDate.minusDays(i);
			String formattedDate = pastDate.format(formatter);
			daysList.add(formattedDate);
		}

		return daysList;
	}

	public ArrayList<Survey> getSurveysForDB(Long userId, String username) {
		ArrayList<Survey> data = new ArrayList<Survey>();
		String query = "SELECT * FROM surveys WHERE creator = ? ORDER BY creation_date DESC LIMIT 5;";
		try (Connection connection = dataSource.getConnection();
				PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setLong(1, userId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					
					Survey survey = new Survey(rs.getString("title"), rs.getString("description"), new User(userId, username), new Category(), rs.getBoolean("is_public"), rs.getString("start_date"), rs.getString("end_date")); 
					int numberOfPeople = getCompletedPeople(rs.getLong("survey_id"));
					survey.setNoOfPeopleCompleted(numberOfPeople);
					data.add(survey);
				}

			}
		} catch (SQLException e) {
			System.err.println("SQL error occurred: " + e.getMessage());
		}
		return data;
	}

}
