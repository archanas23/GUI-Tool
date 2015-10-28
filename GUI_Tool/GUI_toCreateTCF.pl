use Tk;

use Tk::Notebook;

use Tk::Adjuster;

my $mw = new MainWindow; 

$Usage='Parameter';

$code=0;
$return=0;
$input=0;
$flag=1;

$nb = $mw->NoteBook( )->pack(-expand => 1, -fill => 'both');

$nb->configure(-background=>'SkyBlue',-foreground=>'Blue');

$p1 = $nb->add('page1', -label => 'Description');

$p1->configure(-background=>'SkyBlue',-foreground=>'Blue');

$p2=$nb->add('page2', -label => 'IRT & Singularity');

$p2->configure(-background=>'SkyBlue',-foreground=>'Blue');

$p3=$nb->add('page3', -label => 'Test Cases');

$p3->configure(-background=>'SkyBlue',-foreground=>'Blue');

#my $sb = $p2 -> Scrolled('Text',-scrollbars=>"oe") -> pack;
my $adj = $p3 -> Adjuster();

my $frm_name= $p3->Frame();
$frm_name->grid(-row=>1,-column=>1,-columnspan=>15);
$frm_name->configure(-background=>'SkyBlue',-foreground=>'Blue');

 my $lab=$frm_name->Label(-text=>"Test Case Number:");
 $lab->grid(-row=>1,-column=>1);
 
 my $test_case_num=$frm_name->Entry();
$test_case_num->grid(-row=>1,-column=>2);

 my $lab=$frm_name->Label(-text=>"Enter Initialization details:");
 $lab->grid(-row=>2,-column=>1);

 my $rdb_fp = $frm_name -> Radiobutton(-text=>"Func Param",  
		-value=>"Parameter",  -variable=>\$Usage);
		
 $rdb_fp->grid(-row=>2,-column=>2);
 
 my $rdb_p = $frm_name -> Radiobutton(-text=>"Func Pointer",  
		-value=>"Pointer",  -variable=>\$Usage);		

 $rdb_p->grid(-row=>2,-column=>3);
 
  my $rdb_gv = $frm_name -> Radiobutton(-text=>"Global Variable",  
		-value=>"Global",  -variable=>\$Usage);		

 $rdb_gv->grid(-row=>2,-column=>4);
 
  my $rdb_gp = $frm_name -> Radiobutton(-text=>"Global Pointer",  
		-value=>"Global_P",  -variable=>\$Usage);		

 $rdb_gp->grid(-row=>2,-column=>5);
 
 
  my $rdb_r = $frm_name -> Radiobutton(-text=>"Return",  
		-value=>"Return",  -variable=>\$Usage);		

 $rdb_r->grid(-row=>2,-column=>6);
 
my $lab1=$frm_name->Label(-text=>"Enter Output Value:");
$lab1->grid(-row=>4,-column=>3);

my $lab2=$frm_name->Label(-text=>"Enter variable name");
$lab2->grid(-row=>3,-column=>1);

my $entn=$frm_name->Entry();
$entn->grid(-row=>3,-column=>2);

my $lab3=$frm_name->Label(-text=>"Enter Requirement tag");
$lab3->grid(-row=>1,-column=>4);

my $req=$frm_name->Entry();
$req->grid(-row=>1,-column=>5);

my $lab=$frm_name->Label(-text=>"datatype:");
$lab->grid(-row=>4,-column=>1);

my $ent2=$frm_name->Entry()->pack();
$ent2->grid(-row=>4,-column=>2);

my $lab=$frm_name->Label(-text=>"value:");
$lab->grid(-row=>5,-column=>1);

my $ent3=$frm_name->Entry();
$ent3->grid(-row=>5,-column=>2);

my $ent3o=$frm_name->Entry();
$ent3o->grid(-row=>5,-column=>3);
			 
my $but=$frm_name-> Button ( -text => "Inputs",
             -command=>\&push_button);
			 
$but->grid(-row=>6,-column=>2);

my $but1=$frm_name-> Button ( -text => "Min",
             -command=>\&objmin);
$but1->grid(-row=>8,-column=>1);

my $but2=$frm_name-> Button ( -text => "Max",
             -command=>\&objmax);
$but2->grid(-row=>8,-column=>2);

 my $but3=$frm_name-> Button ( -text => "Mid+ve",
             -command=>\&objMidp);
$but3->grid(-row=>8,-column=>3);
		 
my $but4=$frm_name-> Button ( -text => "Mid-ve",
             -command=>\&objMidn);

$but4->grid(-row=>8,-column=>4);
		 
my $but5=$frm_name-> Button ( -text => "OB Low",
             -command=>\&objOBL);

$but5->grid(-row=>8,-column=>5);	
	 
my $but6=$frm_name-> Button ( -text => "OB High",
             -command=>\&objOBH);
			 
$but6->grid(-row=>8,-column=>6);

my $lab=$frm_name->Label(-text=>"Singularity data:");
$lab->grid(-row=>6,-column=>7);

my $sing_data=$frm_name->Text(-width=>50,-height=>1);
$sing_data->grid(-row=>8,-column=>7,-sticky=>"ew");

my $but4=$frm_name-> Button ( -text => "N",
             -command=>\&N_Sing);

$but4->grid(-row=>7,-column=>8);
		 
my $but5=$frm_name-> Button ( -text => "N+1",
             -command=>\&Np1_Sing);

$but5->grid(-row=>8,-column=>8);	
	 
my $but6=$frm_name-> Button ( -text => "N-1",
             -command=>\&Nm1_Sing);
			 
$but6->grid(-row=>9,-column=>8);

my $lab2=$frm_name->Label(-text=>"Test Case Type");
$lab2->grid(-row=>1,-column=>7);

my $listbox1 = $frm_name->Listbox("-width" => 10, 
    "-height" => 2
)->pack;

$listbox1->grid(-row=>2,-column=>7);

$listbox1->insert('end', "Normal", "Robustness",);

$listbox1->bind('<Double-1>', \&test_case_type);

$text_ct = $frm_name->Text ('-width'=> 10, '-height' 
    => 2
)->pack;

$text_ct->grid(-row=>3,-column=>7);

my $lab3=$p2->Label(-text=>"IRT");
$lab3->grid(-row=>1,-column=>1);

my $IRT=$p2->Text(-width=>100,-height=>10);
$IRT->grid(-row=>2,-column=>1,-sticky=>"ew");

my $frm_IRT= $p2->Frame();
$frm_IRT->grid(-row=>2,-column=>2,-columnspan=>3);

my $lab2=$frm_IRT->Label(-text=>"Enter variable name:");
$lab2->grid(-row=>2,-column=>2);

my $var_name=$frm_IRT->Entry();
$var_name->grid(-row=>2,-column=>3);

my $lab2=$frm_IRT->Label(-text=>"Enter Datatype:");
$lab2->grid(-row=>3,-column=>2);

my $var_dt=$frm_IRT->Entry();
$var_dt->grid(-row=>3,-column=>3);

my $lab2=$frm_IRT->Label(-text=>"Enter Range:");
$lab2->grid(-row=>4,-column=>2);

my $var_range=$frm_IRT->Entry();
$var_range->grid(-row=>4,-column=>3);

my $but_IRT=$frm_IRT-> Button ( -text => "ADD Variable",
             -command=>\&ADD_IRT);
			 
$but_IRT->grid(-row=>5,-column=>2);



$IRT->insert('end',"
------------------------------------------------------------------------------------
|Input Range Table:
------------------------------------------------------------------------------------
|Variable            |Type  |Range      |Min|Mid -ve|Zero| Mid+ve|Max|OB Low|OB High|
-------------------------------------------------------------------------------------");

my $lab3=$p2->Label(-text=>"Singularity Table:");
$lab3->grid(-row=>3,-column=>1);

my $Sing_table=$p2->Text(-width=>110,-height=>50);
$Sing_table->grid(-row=>4,-column=>1,-sticky=>"ew");

$Sing_table->insert('end',"
Singularity Table:
----------------------------------------------------------
|Expressions                                  |N-1|N  |N+1|
----------------------------------------------------------");

my $frm_ST= $p2->Frame();
$frm_ST->grid(-row=>4,-column=>2,-columnspan=>3);

my $lab2=$frm_ST->Label(-text=>"Enter the Condition:");
$lab2->grid(-row=>5,-column=>2);

my $Cond=$frm_ST->Text(-width=>50,-height=>2);
$Cond->grid(-row=>6,-column=>2,-sticky=>"ew");

my $but_ST=$frm_ST-> Button ( -text => "ADD Condition",
             -command=>\&ADD_Cond);
			 
$but_ST->grid(-row=>7,-column=>2);
			 
			 
my $but_IRTST=$frm_ST-> Button ( -text => "Extract IRT and Singularity",
             -command=>\&IRT_Sing);
			 
$but_IRTST->grid(-row=>9,-column=>3);

my $lab3=$p1->Label(-text=>"Revision History");
$lab3->grid(-row=>1,-column=>1);

my $rev=$p1->Text(-width=>100,-height=>10);
$rev->grid(-row=>2,-column=>1,-sticky=>"ew");

$rev->insert('end',"
--------------------------------------------------------------------------------------------------
VERSION INFO
--------------------------------------------------------------------------------------------------
Rev     Author            Created/Modified Date              Remarks                              |
--------------------------------------------------------------------------------------------------
1.0    XXXXXXXX            XX-XXX-XXXX                       Initial Version for                  |
--------------------------------------------------------------------------------------------------
"
);

my $lab3=$p1->Label(-text=>"Function Name");
$lab3->grid(-row=>1,-column=>3);

my $func=$p1->Entry();
$func->grid(-row=>1,-column=>4);

my $lab3=$p1->Label(-text=>"Test File");
$lab3->grid(-row=>2,-column=>3);

my $test_file=$p1->Entry();
$test_file->grid(-row=>2,-column=>4);

my $lab3=$p1->Label(-text=>"SDD Version");
$lab3->grid(-row=>3,-column=>3);

my $SDD_version=$p1->Entry();
$SDD_version->grid(-row=>3,-column=>4);

my $lab3=$p1->Label(-text=>"Description");
$lab3->grid(-row=>3,-column=>1);

my $desc=$p1->Text(-width=>100,-height=>50);
$desc->grid(-row=>4,-column=>1,-sticky=>"ew");

my $lab3=$p1->Label(-text=>"Test Case Type Table:");
$lab3->grid(-row=>4,-column=>3);

my $test_case_table=$p1->Text(-width=>40,-height=>10);
$test_case_table->grid(-row=>4,-column=>4,-sticky=>"ew");

$test_case_table->insert('end',"
---------------------------------
| Test Case No.| Test Case Type |
---------------------------------
|  XXXX        | Normal         |
---------------------------------
|  XXXX        | Robustness     |
---------------------------------
		");
		
my $textdata = $p1 -> Frame();
my $srly = $textdata -> Scrollbar(-orient=>'v',-command=>[yview => $desc]);
my $srlx = $textdata -> Scrollbar(-orient=>'h',-command=>[xview => $desc]);

$desc -> configure(-yscrollcommand=>['set', $srly], 
		-xscrollcommand=>['set',$srlx]);

my $txt2=$p3->Text(-width=>100,-height=>5);
$txt2->grid(-row=>10,-column=>1,-sticky=>"ew");

my $txt=$p3->Text(-width=>100,-height=>20);
$txt->grid(-row=>11,-column=>1,-sticky=>"ew");

my $textarea = $p3 -> Frame();

my $srl_y = $textarea -> Scrollbar(-orient=>'v',-command=>[yview => $txt]);
my $srl_x = $textarea -> Scrollbar(-orient=>'h',-command=>[xview => $txt]);
$txt -> configure(-yscrollcommand=>['set', $srl_y], 
		-xscrollcommand=>['set',$srl_x]);
		
my $srl_yo = $textarea -> Scrollbar(-orient=>'v',-command=>[yview => $txt2]);
my $srl_xo = $textarea -> Scrollbar(-orient=>'h',-command=>[xview => $txt2]);
$txt2 -> configure(-yscrollcommand=>['set', $srl_yo], 
		-xscrollcommand=>['set',$srl_xo]);
		
my $but7=$frm_name-> Button ( -text => "Export tcf",
             -command=>\&Save_tcf);
			 
$but7->grid(-row=>1,-column=>15);

my $but_append=$frm_name-> Button ( -text => "Append tc",
             -command=>\&Append_tcf);
			 
$but_append->grid(-row=>3,-column=>15);

my $frame2= $p3->Frame();
$frame2->grid(-row=>10,-column=>2,-columnspan=>3);
$frame2->configure(-background=>'skyblue',-foreground=>'Blue');

my $lab3=$frame2->Label(-text=>"Stub Name");
$lab3->grid(-row=>10,-column=>2);

my $Stub_name=$frame2->Entry();
$Stub_name->grid(-row=>10,-column=>3);
			 
my $lab3=$frame2->Label(-text=>"Stub Parameter Datatype");
$lab3->grid(-row=>11,-column=>2);

my $Stub_param=$frame2->Text(-width=>10,-height=>5)->pack();
$Stub_param->grid(-row=>11,-column=>3);

my $lab3=$frame2->Label(-text=>"Stub Hit Count");
$lab3->grid(-row=>12,-column=>2);

my $Stub_Hit_count=$frame2->Entry();
$Stub_Hit_count->grid(-row=>12,-column=>3);

my $frame3= $p3->Frame();

$frame3->grid(-row=>11,-column=>2,-columnspan=>3);
$frame3->configure(-background=>'skyblue',-foreground=>'Blue');

my $lab3=$frame3->Label(-text=>"Input Parameter Check");
$lab3->grid(-row=>11,-column=>2);

my $Input_param_check=$frame3->Text(-width=>37,-height=>10)->pack();

$Input_param_check->grid(-row=>12,-column=>2);

$Input_param_check->insert('end',"
        # Begin TC Stub Input Params

          Name = 
          Type = 
          Value = 

        # End TC Stub Input Params
		");
		
my $lab3=$frame3->Label(-text=>"Code Segment:");
$lab3->grid(-row=>13,-column=>2);

my $Code_seg=$frame3->Text(-width=>20,-height=>5)->pack();
$Code_seg->grid(-row=>14,-column=>2);

my $lab3=$frame3->Label(-text=>"Stub Return:");
$lab3->grid(-row=>11,-column=>4);

my $return_val=$frame3->Text(-width=>37,-height=>10)->pack();
$return_val->grid(-row=>12,-column=>4);

$return_val->insert('end',"
        # Begin TC Stub Return Value

          Name = 
          Type = 
          Value = 

        # End TC Stub Return Value
		");

my $chk1 = $frame3 -> Checkbutton(-text=>"Code Segment",
	-variable=>\$code)->pack();
	
$chk1->grid(-row=>13,-column=>3);

my $chk2 = $frame3 -> Checkbutton(-text=>"Input Param",
	-variable=>\$input)->pack();
$chk2->grid(-row=>15,-column=>3);

my $chk3 = $frame3 -> Checkbutton(-text=>"Stub Return",
	-variable=>\$return)->pack();
$chk3->grid(-row=>14,-column=>3);

my $but_stub=$frame2-> Button ( -text => "Stub",
             -command=>\&sd);

$but_stub->grid(-row=>11,-column=>5);

MainLoop;

sub ADD_IRT
{
$var_n=$var_name->get();
$var_datatype=$var_dt->get();
$var_r=$var_range->get();
$IRT->insert('end',"
|$var_n|$var_datatype    |$var_r  |    |    |    |     |    |    |    |
-----------------------------------------------------------------------");
}

sub ADD_Cond
{
$condition=$Cond->get("1.0",'end-1c');
$Sing_table->insert('end',"
|$condition|  |  |  |
----------------------------------------------------------");
}

sub test_case_type
{
    $tc_type = $listbox1->get('active');
    $text_ct->insert('end', "$tc_type ");
}

sub Append_tcf
{
open(OUT,">>test.tcf")  or die "Couldn't open file test.tcf, $!";

my $tc_num=$test_case_num->get();

my $func_name= $func->get();

my $tct=$text_ct->get("1.0",'end-1c');

print OUT "
    # Begin Test Case

      File = ..\..\D:\IHDC_MEP_2015_01_13_17_10_00\IHDC MEP\App Code\SRC\Application\Sensor_Bridgewire.c
      Procedure = $func_name
      Procedure Number = 7
      Creation Date = Aug 04 2014 12:08:20
      Description = TEST $tc_num

      # Begin Text
"."\n\n";

print OUT "Test Case type = $tct"."\n\n";

my $requirement= $req->get();
print OUT "Requirements:$requirement"."\n\n";

print OUT "Objectives:"."\n\n";

$objextives=$txt2->get("1.0",'end-1c');
print OUT $objextives."\n\n";

print OUT "
   Control Flow:   NA


      # End Text
	  "."\n\n";
	  
$tc=$txt->get("1.0",'end-1c');

print OUT $tc;

print OUT "    # End Test Case";

close(OUT)
}

sub IRT_Sing
{
open(IRT,">IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

my $input_range_table=$IRT->get("1.0",'end-1c');
print IRT "$input_range_table"."\n\n";

my $st=$Sing_table->get("1.0",'end-1c');
print IRT $st;

close(IRT)
}


sub Save_tcf
{
open(OUT,">test.tcf")  or die "Couldn't open file test.tcf, $!";

$rev_history= $rev->get("1.0",'end-1c');
print OUT $rev_history."\n\n";

print OUT "Description:"."\n";

$description= $desc->get("1.0",'end-1c');
print OUT $description."\n\n";

my $SDD_v= $SDD_version->get();
print OUT "SDD MEP Baseline version:$SDD_v"."\n\n";

my $func_name= $func->get();
print OUT "Function:$func_name"."\n\n";

my $test_file_tag= $test_file->get();
print OUT "Test File:$test_file_tag"."\n\n";

my $input_range_table=$IRT->get("1.0",'end-1c');
print OUT "$input_range_table"."\n";

my $st=$Sing_table->get("1.0",'end-1c');
print OUT $st."\n";

my $tct=$text_ct->get("1.0",'end-1c');

my $tc_table=$test_case_table->get("1.0",'end-1c');
print OUT $tc_table;

my $tc_num=$test_case_num->get();

print OUT "
    # Begin Test Case

      File = ..\\..\\D:\\IHDC_MEP_2015_01_13_17_10_00\\IHDC MEP\\App Code\\SRC\\Application\\Sensor_Bridgewire.c
      Procedure = $func_name
      Procedure Number = 7
      Creation Date = Aug 04 2014 12:08:20
      Description = TEST $tc_num

      # Begin Text
"."\n\n";

print OUT "Test Case type = $tct"."\n\n";

my $requirement= $req->get();
print OUT "Requirements:$requirement"."\n\n";

print OUT "Objectives:"."\n\n";

$objextives=$txt2->get("1.0",'end-1c');
print OUT $objextives."\n\n";

print OUT "
   Control Flow:   NA


      # End Text
	  "."\n\n";
	  
$tc=$txt->get("1.0",'end-1c');

print OUT $tc."\n";

print OUT "    # End Test Case"."\n";

close(OUT)

}

sub push_button{
my $name=$entn->get();
my $dt=$ent2->get();
my $val= $ent3->get();
my $val_out= $ent3o->get();

#print $Usage;

if($Usage =~ /Pointer/)
{
$txt->insert('end',"
		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = P
		  Value = $val

		# End Variable"."\n"
		);
}
	
elsif($Usage=~/Global_P/)
{
$txt->insert('end',"
		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = Q
		  Value = $val

		# End Variable"."\n"
		);
}	

elsif($Usage=~/Parameter/)
{		
$txt->insert('end',"
		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = Z
		  Value = $val

		# End Variable

		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = H
		  Value = $val_out

		# End Variable"."\n"
		);
}

elsif($Usage=~/Return/)
{
$txt->insert('end',"
		# Begin Variable

		  Name = %
		  Decl_type = $dt
		  Usage = O
		  Value = $val

		# End Variable"."\n"
		);
}	

else
{		
$txt->insert('end',"
		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = G
		  Value = $val

		# End Variable

		# Begin Variable

		  Name = $name
		  Decl_type = $dt
		  Usage = H
		  Value = $val_out

		# End Variable"."\n"
		);
}
}

sub sd{
my $stub_name=$Stub_name->get();
my $stub_hit_count= $Stub_Hit_count->get();
my $stub_param=$Stub_param->get("1.0",'end-1c');
my $code_segment=$Code_seg->get("1.0",'end-1c');
my $param= $Input_param_check->get("1.0",'end-1c');
my $return_data= $return_val->get("1.0",'end-1c');

$txt2->insert('end',"To verify that the \"$stub_name\" stub is getting hit $stub_hit_count time(s)\n");

if(($code==1)&&($input==1)&&($return==1))
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count


      # Begin TC Stub Code Segment
$code_segment
      # End TC Stub Code Segment

$param

$return_data

      # End TC Stub
	  "."\n");
}
elsif(($code==1)&&($input==1))
{
 $txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count


      # Begin TC Stub Code Segment
$code_segment
      # End TC Stub Code Segment

$param

      # End TC Stub
	  "."\n");
}  
elsif(($code==1)&&($return==1))
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count


      # Begin TC Stub Code Segment
$code_segment
      # End TC Stub Code Segment

$return_data

      # End TC Stub
	  "."\n");
	  }
elsif(($input==1)&&($return==1))
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count

$param

$return_data

      # End TC Stub
	  "."\n");
}
elsif($code==1)
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count
	 
      # Begin TC Stub Code Segment
$code_segment
      # End TC Stub Code Segment

      # End TC Stub
	  "."\n");
}
elsif($input==1)
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count

$param

      # End TC Stub
	  "."\n");
}
elsif($return==1)
{
$txt->insert('end',"
      # Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  # Begin Overloading
$stub_param
  # End Overloading

      # Begin TC Stub TC Hit Count

        Setting = 3
        Specified = $stub_hit_count
      # End TC Stub TC Hit Count

$return_data

      # End TC Stub
	  "."\n");
}
else
{
$txt->insert('end',"
      Begin TC Stub

        Procedure = $stub_name
  Overloading = Prototype

  Begin Overloading
$stub_param
  End Overloading

      Begin TC Stub TC Hit Count

        # Setting = 3
        # Specified = $stub_hit_count
      End TC Stub TC Hit Count

      End TC Stub
	  "."\n");
}
}

sub objmin{
my $name=$entn->get();
$txt2->insert('end',"To verify Min value of $name\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$tc_num\|$a[3]\|$a[4]\|$a[5]\|$a[6]\|$a[7]\|$a[8]\|";

}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	
close (IRT_UPDATE);		
}

sub objmax{
my $name=$entn->get();
$txt2->insert('end',"To verify Max value of $name\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$a[2]\|$a[3]\|$a[4]\|$a[5]\|$tc_num\|$a[7]\|$a[8]\|";
print $data;
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	

close (IRT_UPDATE);		
}

sub objMidp{
my $name=$entn->get();
$txt2->insert('end',"To verify Mid+ve value of $name\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$a[2]\|$a[3]\|$a[4]\|$tc_num\|$a[6]\|$a[7]\|$a[8]\|";
print $data;
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	

close (IRT_UPDATE);	
}

sub objMidn{
my $name=$entn->get();
$txt2->insert('end',"To verify Mid-ve value of $name\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$a[2]\|$tc_num\|$a[4]\|$a[5]\|$a[6]\|$a[7]\|$a[8]\|";
print $data;
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	

close (IRT_UPDATE);	
}

sub objOBL{
my $name=$entn->get();
$txt2->insert('end',"To verify OB Low value of $name\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$a[2]\|$a[3]\|$a[4]\|$a[5]\|$a[6]\|$tc_num\|$a[8]\|";
print $data;
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	

close (IRT_UPDATE);	
}

sub objOBH{
my $name=$entn->get();
$txt2->insert('end',"To verify OB High value of $name\n");
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;
 $a[3]=$4;
 $a[4]=$5;
 $a[5]=$6;
 $a[6]=$7;
 $a[7]=$8;
 $a[8]=$9;

$data="\|$name\|$a[0]\|$a[1]\|$a[2]\|$a[3]\|$a[4]\|$a[5]\|$a[6]\|$a[7]\|$tc_num\|";
print $data;
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$name\|/)
		{
		$j=$i-1;
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	

close (IRT_UPDATE);	
}

sub N_Sing{
my $sing=$sing_data->get("1.0",'end-1c');
$txt2->insert('end',"To verify N singularity of $sing\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$sing\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;

$data="\|$sing\|$a[0]\|$tc_num\|$a[2]|";
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$sing\|/)
		{
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	
close (IRT_UPDATE);	
}

sub Np1_Sing{
my $sing=$sing_data->get("1.0",'end-1c');
$txt2->insert('end',"To verify N+1 singularity of $sing\n");
@lines=();
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$sing\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;

$data="\|$sing\|$a[0]\|$a[1]\|$tc_num|";
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$sing\|/)
		{
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	
close (IRT_UPDATE);	
}

sub Nm1_Sing{
my $sing=$sing_data->get("1.0",'end-1c');
$txt2->insert('end',"To verify N-1 singularity of $sing\n");
@lines=();
print $sing;
my $tc_num=$test_case_num->get();

open(IRT,"<IRT_Singularity.tcf")  or die "Couldn't open file IRT_Singularity.tcf, $!";

while(<IRT>)
 {
push(@lines,$_);
#$data=/\|$name\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|(.*)\|/;
my @a;
if(/\|$sing\s+\|(.*)\|(.*)\|(.*)\|/)
{
 $a[0]=$1;
 $a[1]=$2;
 $a[2]=$3;

$data="\|$sing\|$tc_num\|$a[1]\|$a[2]|";
}
}
 close (IRT);

for(my $i=0; $i<@lines; $i++)
{	
		if($lines[$i]=~/\|$sing\|/)
		{
		$lines[$i]=~s/$lines[$i]//;
		$lines[$i]=$data."\n";
		}
}

open(IRT_UPDATE,">IRT_Singularity.tcf")or die "Couldn't open file IRT_Singularity.tcf, $!";

for(my $k=0; $k<@lines; $k++)
{
print IRT_UPDATE $lines[$k];
}	
close (IRT_UPDATE);	
}