package cc_w10.service;

import java.io.File;
import java.io.IOException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class UploadS3 {
	private static final String SUFFIX = "/";
	private static final String bucketName = "aws-group5";
	private static final String folderName = "Folder 1";
	public String upload(File filePath) throws IOException {
		AWSCredentials credentials = new BasicAWSCredentials(
				"AKIAIRRRO6RFNSTXMURQ", 
				"+8Drzi3CM1u8bhBrKpIiGwS2h2lXhNpU/6/Z6c4s");
		
		// create a client connection based on credentials
		AmazonS3 s3client = new AmazonS3Client(credentials);				
		// upload file to folder and set it to public
		System.out.println(filePath.getName());
		String fileName = folderName + SUFFIX + filePath.getName();
		s3client.putObject(new PutObjectRequest(bucketName, fileName, 
					filePath.getAbsoluteFile())
				.withCannedAcl(CannedAccessControlList.PublicRead));
		return "https://s3-ap-southeast-1.amazonaws.com/"+bucketName+SUFFIX+folderName+SUFFIX+filePath.getName();
	}
}
