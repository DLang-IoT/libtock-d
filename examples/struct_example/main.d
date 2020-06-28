module struct_example;

import tock;
import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;

struct String {
    char* s = null;
    // string s;
    int len = 0;

    this(string str) @nogc {
        if (str.length) {
            this.s = cast(char*) malloc (str.length + 1);
            strncpy(this.s, cast(char*) str, str.length);
            this.s[str.length] = 0;
            // this.s = s;
            this.len = str.length;
        } 
        printf("%x - %s\n", &this.s, this.s);
        printf("%x - %d\n", &this.len, this.len);  
    }

    this(this) @nogc {

    }

    this (ref return scope String* rhs) @nogc {
        // printf("aici cu %x\n", &rhs.len);
        this.len = rhs.len;
        //this.s = (*rhs).s;
        printf("aici cu %x si cu %x\n", &(*rhs).s, &(*rhs).len);
        // this.s = cast(char*) malloc (this.len + 1);
        // strncpy(this.s, rhs.s, this.len);
        // this.s[this.len] = 0;
        // rhs.len = this.len;
        // rhs.s = cast(char*) malloc(this.len + 1);
        // strncpy(rhs.s, this.s, this.len);
        // printf("%s\n", rhs.s);
        // printf("%d\n", rhs.len);
    }
    

    // ~this() @nogc {
    // //    // if (len) free(s);
    // }

    @nogc String opBinary(string op) (String* rhs) if (op == "~")
    {
        String newString;
        newString.len = this.len + (*rhs).len;
        // printf("%x\n", &this.s);
        // printf("%x\n", &this.len);
        printf("%x - %s\n", &(*rhs).s, (*rhs).s);
        printf("%x - %d\n", &(*rhs).len, (*rhs).len);
        newString.s = cast(char*) malloc((newString.len + 1) * char.sizeof);
        printf("%d\n", newString.len);
        printf("%s\n", this.s);
        // assert(newString.s != null);
        if (this.len) {
            // for (int i = 0; i < this.len; i++)
            //     newString.s[i] = this.s[i];
            strcpy(newString.s, this.s);
        }
        printf("%s\n", &newString.s);
        if ((*rhs).len) {
            // strncpy(&newString.s[this.len], &(*rhs).s, (*rhs).len);
        }
        newString.s[newString.len] = 0;
        // printf("%s\n", newString.s);
        // newString.len += rhs.len;
        return newString;
    }
}

extern(C) int main() @nogc {
    String s = String("hellow");
    String t = String("world");
    // String st = t;
    String st = s ~ &t;
    // printf("%d\n", st.len);
    // printf("%s\n", st.s);
    return 0;
}