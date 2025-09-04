class Solution(object):
    def romanToInt(self, s):
        i=0
        total=0
        roman_map={
            'M':1000,
            'D':500,
            'C':100,
            'L':50,
            'X':10,
            'V':5,
            'I':1
        }
        exp=[]
        while i<len(s):
            if i<len(s) and roman_map[s[i]]<roman_map[s[i+1]]:
                pair = s[i] + s[i+1]
                first_val = roman_map[s[i]]
                second_val = roman_map[s[i+1]]
                value = second_val - first_val
                print(pair,"=",second_val,first_val,"=",value)
                total += value
                i += 2
            else:
                value=roman_map[s[i]]
                exp.append(f"{s[i]}={value}")
                total+=value
                i+=1
        print("Output:",total)
        print("Explanation:",",".join(exp))

s = input("Enter a number: ")
sol = Solution() 
sol.romanToInt(s)