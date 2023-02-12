package db;

public class dbintegrityException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public dbintegrityException(String msg) {
		super(msg);
	}

}
