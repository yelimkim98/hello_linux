package helloLinux.linux;

public class FileTree {

	String user;
    FileNode root;
    FileNode current;
    
    public FileTree( FileNode root ) {
        this.root = root;
        current=root;
        root.parentdirectory=null;
        this.user="user";
    }
}
