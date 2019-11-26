package helloLinux.linux;

public class Shell {
	private FileTree tree;
	private StringBuilder history = new StringBuilder();
	
	public Shell() {
		tree = new FileTree(new FileNode("root"));
		Instruction.touch("hello.txt", tree);
		history = new StringBuilder();
	}
	
	public String shell(String instruction) {
		
		history.append("user@centos: " + instruction + "<br>");
		
		if(instruction.length() > 1 && instruction.substring(0,2).equals("ls"))
		{
			history.append(Instruction.ls(tree, instruction));
		}
		else if(instruction.length() > 1 && instruction.substring(0,2).equals("cd"))
		{
			Instruction.cd(instruction.substring(3),tree);
		}
		else if(instruction.length() > 1 && instruction.substring(0,2).equals("rm")) {
			Instruction.rm(instruction.substring(3),tree);
		}
		else if (instruction.length() > 1 && instruction.substring(0, 2).equals("cp")) {
			Instruction.cp(instruction.substring(3), tree);
		}
		else if(instruction.length() > 2 && instruction.substring(0,3).equals("pwd"))
		{
			history.append(Instruction.pwd(tree.current) + "<br>");
		}
		else if(instruction.length() > 4 && instruction.substring(0,5).equals("touch"))
		{
			Instruction.touch(instruction.substring(6), tree);
		}
		else if(instruction.length() > 4 && instruction.substring(0,5).equals("mkdir")) 
		{	
			Instruction.mkdir(instruction.substring(6),tree);
		}
		
		return history.toString();
	}
	
	public void clearHistory() {
		history.delete(0, history.length());
	}
}