byte person[5];
byte conflictA[5];
byte conflictB[5];
byte not_alone[5];
byte at=0;
byte inA=0;
byte inB=0;
byte in=0;
byte alone=0;
byte i=0;


init 
{ 
	atomic
	{ 
		person[0] =0; 
		person[1] =1; 
		person[2] =2; 
		person[3] =3;
		person[4] =4; 
		conflictA[0] =1;
		conflictA[1] =0;
		conflictA[2] =0;
		conflictA[3] =1;
		conflictA[4] =1;
		conflictB[0] =0;
		conflictB[1] =1;
		conflictB[2] =1;
		not_alone[0] =1;
		not_alone[1] =1;
		not_alone[2] =0;
		not_alone[3] =0;
		not_alone[4] =0; 
	}

	atomic 
	{ 
		run Elevator();
	} 
}

proctype Elevator() 
{ 

q: if
:: person[0]==0 && person[1]==0 && person[2]==0 && person[3]==0 && person[4]==0 &&
   !(alone == 0 && at == 0 && conflictA[0] == 1 && conflictA[1] == 0 && conflictA[2] == 0 && conflictA[3] == 1 && conflictA[4] == 1 && conflictB[0] == 0 && conflictB[1] == 1 && conflictB[2] == 1 && conflictB[3] == 0 && conflictB[4] == 0 && i == 0 && in == 0 && inA == 0 && inB == 0 && not_alone[0] == 1 && not_alone[1] == 1 && not_alone[2] == 0 && not_alone[3] == 0 && not_alone[4] == 0 && person[0] == 0 && person[1] == 0 && person[2] == 0 && person[3] == 0 && person[4] == 0) &&
   !(alone == 0 && at == 1 && conflictA[0] == 1 && conflictA[1] == 0 && conflictA[2] == 0 && conflictA[3] == 1 && conflictA[4] == 1 && conflictB[0] == 0 && conflictB[1] == 1 && conflictB[2] == 1 && conflictB[3] == 0 && conflictB[4] == 0 && i == 0 && in == 0 && inA == 0 && inB == 0 && not_alone[0] == 1 && not_alone[1] == 1 && not_alone[2] == 0 && not_alone[3] == 0 && not_alone[4] == 0 && person[0] == 0 && person[1] == 0 && person[2] == 0 && person[3] == 0 && person[4] == 0) &&
   !(alone == 0 && at == 2 && conflictA[0] == 1 && conflictA[1] == 0 && conflictA[2] == 0 && conflictA[3] == 1 && conflictA[4] == 1 && conflictB[0] == 0 && conflictB[1] == 1 && conflictB[2] == 1 && conflictB[3] == 0 && conflictB[4] == 0 && i == 0 && in == 0 && inA == 0 && inB == 0 && not_alone[0] == 1 && not_alone[1] == 1 && not_alone[2] == 0 && not_alone[3] == 0 && not_alone[4] == 0 && person[0] == 0 && person[1] == 0 && person[2] == 0 && person[3] == 0 && person[4] == 0) &&
   !(alone == 0 && at == 3 && conflictA[0] == 1 && conflictA[1] == 0 && conflictA[2] == 0 && conflictA[3] == 1 && conflictA[4] == 1 && conflictB[0] == 0 && conflictB[1] == 1 && conflictB[2] == 1 && conflictB[3] == 0 && conflictB[4] == 0 && i == 0 && in == 0 && inA == 0 && inB == 0 && not_alone[0] == 1 && not_alone[1] == 1 && not_alone[2] == 0 && not_alone[3] == 0 && not_alone[4] == 0 && person[0] == 0 && person[1] == 0 && person[2] == 0 && person[3] == 0 && person[4] == 0);
	goto done; 

::  atomic
{person[0]==at && in<3 && (conflictA[0]==0 || inB==0) && (conflictB[0]==0 || inA==0) && (not_alone[0]==0 || in>0);
	person[0] = 255;
	in = in+1;
	inA = inA+conflictA[0];
	inB = inB+conflictB[0];
	alone = alone+not_alone[0];
	}
	goto q; 

::  atomic
{person[1]==at && in<3 && (conflictA[1]==0 || inB==0) && (conflictB[1]==0 || inA==0) && (not_alone[1]==0 || in>0);
	person[1] = 255;
	in = in+1;
	inA = inA+conflictA[1];
	inB = inB+conflictB[1];
	alone = alone+not_alone[1];
	} 
	goto q; 

::  atomic
{person[2]==at && in<3 && (conflictA[2]==0 || inB==0) && (conflictB[2]==0 || inA==0) && (not_alone[2]==0 || in>0);
	person[2] = 255;
	in = in+1;
	inA = inA+conflictA[2];
	inB = inB+conflictB[2];
	alone = alone+not_alone[2];
	} 
	goto q; 

::  atomic
{person[3]==at && in<3 && (conflictA[3]==0 || inB==0) && (conflictB[3]==0 || inA==0) && (not_alone[3]==0 || in>0);
	person[3] = 255;
	in = in+1;
	inA = inA+conflictA[3];
	inB = inB+conflictB[3];
	alone = alone+not_alone[3];
	} 
	goto q; 

::  atomic
{person[4]==at && in<3 && (conflictA[4]==0 || inB==0) && (conflictB[4]==0 || inA==0) && (not_alone[4]==0 || in>0);
	person[4] = 255;
	in = in+1;
	inA = inA+conflictA[4];
	inB = inB+conflictB[4];
	alone = alone+not_alone[4];
	} 
	goto q; 

::  atomic
{person[0]==255 && (in>2 || (alone-not_alone[0]==0));person[0] = at;
	in = in-1;
	inA = inA-conflictA[0];
	inB = inB-conflictB[0];
	alone = alone-not_alone[0];
	} 
	goto q; 

::  atomic
{person[1]==255 && (in>2 || (alone-not_alone[1]==0));
	person[1] = at;
	in = in-1;
	inA = inA-conflictA[1];
	inB = inB-conflictB[1];
	alone = alone-not_alone[1];
	} 
	goto q; 

::  atomic
{person[2]==255 && (in>2 || (alone-not_alone[2]==0));
	person[2] = at;
	in = in-1;
	inA = inA-conflictA[2];
	inB = inB-conflictB[2];
	alone = alone-not_alone[2];
	}
	goto q; 

::  atomic
{
	person[3]==255 && (in>2 || (alone-not_alone[3]==0));
	person[3] = at;
	in = in-1;
	inA = inA-conflictA[3];
	inB = inB-conflictB[3];
	alone = alone-not_alone[3];
	} 
	goto q; 

::  atomic
{
	person[4]==255 && (in>2 || (alone-not_alone[4]==0));
	person[4] = at;
	in = in-1;
	inA = inA-conflictA[4];
	inB = inB-conflictB[4];
	alone = alone-not_alone[4];
	}
	goto q; 

:: at = 0;
	goto q; 

:: at = 1;
	goto q; 

:: at = 2;
	goto q; 

:: at = 3;
	goto q; 

:: at = 4; 
	goto q; 

fi;
done: 
 false;
 }

