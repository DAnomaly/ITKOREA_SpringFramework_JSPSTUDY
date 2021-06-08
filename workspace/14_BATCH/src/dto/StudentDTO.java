package dto;

/**
 * @author ITSC
 *
 */
public class StudentDTO {

	// field
	private String sno;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private double ave;
	private char grade;

	// constructor
	public StudentDTO(String sno, String name, int kor, int eng, int mat) {
		super();
		this.sno = sno;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.ave = (kor + eng + mat) / 3.0;
		switch ((int)(ave / 10)) {
		case 10:
		case 9:
			this.grade = 'A';
			break;
		case 8:
			this.grade = 'B';
			break;
		case 7:
			this.grade = 'C';
			break;
		case 6:
			this.grade = 'D';
			break;
		default:
			this.grade = 'F';
			break;
		}
	}
	public StudentDTO() {
		super();
	}
	
	// getter setter
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public double getAve() {
		return ave;
	}
	public void setAve(double ave) {
		this.ave = ave;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "[sno:" + sno + ", name:" + name + ", kor:" + kor + ", eng:" + eng + ", mat:" + mat + ", ave:"
				+ ave + ", grade:" + grade + "]";
	}
	
	
	
}
