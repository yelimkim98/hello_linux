package helloLinux.linux;

public class Instruction {
	
		public static boolean mkdir(String directoryname,FileTree tree) 
		{	
			FileNode currentChild = new FileNode(directoryname);
	        int index=tree.current.childs.indexOf(currentChild);
	        if(index==-1)
	        {
	        	 tree.current.childs.add( currentChild );
	             currentChild.parentdirectory=tree.current;
	             currentChild.isfile=false;
	             currentChild.auth="drwxr-xr-x";
	             currentChild.size=2;
	             return false;
	        }
	        else {
	        	currentChild=null;
	        	System.out.println("Failed to make such directory file exists");
	        	return true;
	        }
		}
		public static void touch(String filename,FileTree tree)
		{
			if(mkdir(filename,tree))
				return;
			tree.current.childs.get(tree.current.childs.size()-1).isfile=true;
			tree.current.childs.get(tree.current.childs.size()-1).auth="-rw-r--r--";
			tree.current.childs.get(tree.current.childs.size()-1).size=0;
		}
		public static void cd(String inputpath,FileTree tree) {
			for(int i=0;i<tree.current.childs.size();i++)
			{
				
				if(tree.current.childs.get(i).name.equals(inputpath)&&tree.current.childs.get(i).isfile==false)
				{
					FileNode temp=tree.current;
					tree.current=tree.current.childs.get(i);
					tree.current.parentdirectory=temp;
					return;
				}
				
				else if(tree.current.childs.get(i).name.equals(inputpath)&&tree.current.childs.get(i).isfile==true)
				{
					System.out.println("Not a directory");
					return;
				}
				else
					continue;
			}
			if(inputpath.equals(".."))
			{
				tree.current=tree.current.parentdirectory;
			}
			
			else if(inputpath.equals(".")) {
				tree.current=tree.current;
			}
			else {
				System.out.println("No such file or directory");
			}
		}
		public static String pwd(FileNode current) {
			/*System.out.println(tree.current.incrementalPath);*/
			if(current.parentdirectory==null)
				return "";
			return pwd(current.parentdirectory)+"/"+current.name;
		}
		
		public static String ls(FileTree tree, String option) {
			if(tree.current.childs.isEmpty()) {
				return "";
			}
			if(option.length()==2)
			{
				String ret = "";
				for(int i=0;i<tree.current.childs.size();i++)
				{
					ret += tree.current.childs.get(i).name+"\t" + "<br>";
				}
				return ret;
			}
			if(option.substring(3).equals("-l"))
			{
				StringBuilder ret = new StringBuilder();
				for(int i=0;i<tree.current.childs.size();i++)
				{
					ret.append(
							tree.current.childs.get(i).auth+"\t"+"1 "+tree.user+" studs"+"\t\t"+tree.current.childs.get(i).size+" "+tree.current.childs.get(i).time+tree.current.childs.get(i).name+"\t<br>"
					);
				}
				return ret.toString();
			}
			return "error";
		}
		
		/*public static void mv(FileTree tree,String parameter) {
			String []parameters=parameter.split(" ");
				
				if(existing(parameters[0],tree)==null)
				{
					System.out.println("cannot access "+parameters[0]);
					return;
				}
				
				else if(existing(parameters[1],tree)==null)
				{
					FileNode temp;
					existing(parameters[0],tree).name=parameters[1];
					temp=existing(parameters[0],tree);
					for(int i=0;;i++) {
						
						if(temp.childs.get(i)!=null)
						{
							temp=temp.childs.get(i);
							
						}
					}
					
			
					return;
				}

		}
	*/	public static void cp(String parameter,FileTree tree) {
			String [] parameters=parameter.split(" ");
			if(existing(parameters[0],tree)==null) 
				System.out.println("cannot access "+parameters[0]);
			else if(!(existing(parameters[0],tree).isfile))
				System.out.println(parameters[0]+" is a directory");
			else if(existing(parameters[1],tree)==null) {
				touch(parameters[1],tree);
			}
			else if(existing(parameters[1],tree).isfile) {
				rm(parameters[1],tree);
				touch(parameters[1],tree);
				//+내용복사
			}
			else {
				cd(parameters[1],tree);
				touch(parameters[0],tree);
				cd("..",tree);
			}
		}
		public static void rm(String name,FileTree tree)
		{
			if(existing(name,tree)!=null)
			{
				tree.current.childs.remove(existing(name,tree));
			}
			else {
				System.out.println("No such file or directory");
			}
		}
		public static FileNode existing(String name,FileTree tree) {
			for(int i=0;i<tree.current.childs.size();i++)
			{
				if(tree.current.childs.get(i).name.equals(name))
					return tree.current.childs.get(i);	
			}
			return null;	
		}
		
		public static String fullSearching(FileNode current) {
				if(current.parentdirectory==null)
					return "";
				return fullSearching(current.parentdirectory)+"/"+current.name;
		}
}