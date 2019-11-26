package helloLinux.linux;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FileNode {
	List<FileNode> childs;
    List<FileNode> leafs;
    FileNode parentdirectory;
    String name;
    String incrementalPath;
    boolean isfile;
    Date time;
    String auth;
    int size;

    public FileNode( String nodeValue ) {
        childs = new ArrayList<FileNode>();
        leafs = new ArrayList<FileNode>();
        name = nodeValue;
        time=new Date();
    }


}
