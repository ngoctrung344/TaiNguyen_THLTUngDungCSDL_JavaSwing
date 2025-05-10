import java.awt.EventQueue;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class lab4GUI {
	
	public class duan{
		private String tenDA;
		private String maDA;
		public duan() {
			super();
		}
		public duan(String tenDA, String maDA) {
			super();
			this.tenDA = tenDA;
			this.maDA = maDA;
		}
		public String getTenDA() {
			return tenDA;
		}
		public void setTenDA(String tenDA) {
			this.tenDA = tenDA;
		}
		public String getMaDA() {
			return maDA;
		}
		public void setMaDA(String maDA) {
			this.maDA = maDA;
		}
		@Override
		public String toString() {
			return "duan [tenDA=" + tenDA + ", maDA=" + maDA + "]";
		}		
	}
	public class nhanvien {
		private String maNV;
		private String tenNV;
		private Date ngaySinh;
		private int maDA;
		public nhanvien() {
			super();
		}
		public nhanvien(String maNV, String tenNV, Date ngaySinh, int maDA) {
			super();
			this.maNV = maNV;
			this.tenNV = tenNV;
			this.ngaySinh = ngaySinh;
			this.maDA = maDA;
		}
		public String getMaNV() {
			return maNV;
		}
		public void setMaNV(String maNV) {
			this.maNV = maNV;
		}
		public String getTenNV() {
			return tenNV;
		}
		public void setTenNV(String tenNV) {
			this.tenNV = tenNV;
		}
		public Date getNgaySinh() {
			return ngaySinh;
		}
		public void setNgaySinh(Date ngaySinh) {
			this.ngaySinh = ngaySinh;
		}
		public int getMaDA() {
			return maDA;
		}
		public void setMaDA(int maDA) {
			this.maDA = maDA;
		}
		@Override
		public String toString() {
			return "nhanvien [maNV=" + maNV + ", tenNV=" + tenNV + ", ngaySinh=" + ngaySinh + ", maDA=" + maDA + "]";
		}	
	}

	private	static final String URL = "jdbc:mysql://localhost:3306/dbduan";
	private static final String user = "root";
	private static final String pasw = "";
	
	public static void xuatDATA()
	{
		String query = "SELECT * from nhanvien";
		try (Connection conn = DriverManager.getConnection(URL,user,pasw);
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String manv = rs.getString("manv");
				String tennv = rs.getString("tennv");
				Date ngaysinh = rs.getDate("ngaysinh");
				int mada = rs.getInt("mada");
				System.out.print(manv + " " + tennv + " " + ngaysinh + " " + mada);
				System.out.println();
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	private void ketnoiDATA(List<nhanvien> dsnv) {
	    String query = "SELECT * from nhanvien";
	    try (Connection conn = DriverManager.getConnection(URL, user, pasw);
	         PreparedStatement pstmt = conn.prepareStatement(query)) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            String manv = rs.getString("manv");
	            String tennv = rs.getString("tennv");
	            java.sql.Date sqlDate = rs.getDate("ngaysinh"); // Get sql.Date
	            Date ngaysinh = new Date(sqlDate.getTime()); // Convert to util.Date
	            int mada = rs.getInt("mada");
	            nhanvien temp = new nhanvien(manv, tennv, ngaysinh, mada);
	            dsnv.add(temp);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	private void updateTable(List<nhanvien> dsnv) {
	    DefaultTableModel model = (DefaultTableModel) tableNhanVien.getModel();
	    model.setRowCount(0); // Clear existing rows

	    for (nhanvien nv : dsnv) {
	        model.addRow(new Object[]{
	            nv.getMaNV(),
	            nv.getTenNV(),
	            nv.getNgaySinh(),
	            nv.getMaDA()
	        });
	    }
	}
	private JFrame frame;
	private JTable tableNhanVien;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		xuatDATA();

		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					lab4GUI window = new lab4GUI();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public lab4GUI() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		tableNhanVien = new JTable();
		tableNhanVien.setCellSelectionEnabled(true);
		tableNhanVien.setColumnSelectionAllowed(true);
		tableNhanVien.setFillsViewportHeight(true);
		tableNhanVien.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"manv", "tennv", "ngaysinh", "mada"
			}
		));
		tableNhanVien.getColumnModel().getColumn(0).setPreferredWidth(121);
		tableNhanVien.getColumnModel().getColumn(1).setPreferredWidth(161);
		tableNhanVien.getColumnModel().getColumn(2).setPreferredWidth(181);
		tableNhanVien.getColumnModel().getColumn(3).setPreferredWidth(179);
		tableNhanVien.setBounds(0, 137, 370, 124);
		frame.getContentPane().add(tableNhanVien);
		
		JButton btnLoadData = new JButton("LoadData");
		btnLoadData.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				List<nhanvien> dsnv = new ArrayList<nhanvien>();
				ketnoiDATA(dsnv);
				updateTable(dsnv);
			}
		});
		btnLoadData.setBounds(35, 41, 114, 42);
		frame.getContentPane().add(btnLoadData);
		
	}
}
