#include <stdio.h>
#include <string.h>

// Function to simulate DFA
int dfa(char* str) {
    int state = 0;  // Starting at state q0
    
    for (int i = 0; str[i] != '\0'; i++) {
        switch (state) {
            case 0: // q0: Initial state (starting point)
                if (str[i] == 'a') {
                    state = 1; // move to state q1 on 'a'
                } else {
                    return 0; // Invalid transition, string must start with 'a'
                }
                break;
            case 1: // q1: After reading 'a'
                if (str[i] == 'b') {
                    state = 2; // move to state q2 on 'b'
                } else {
                    return 0; // Invalid transition, must be 'b' after 'a'
                }
                break;
            case 2: // q2: After reading 'ab'
                if (str[i] == 'a') {
                    state = 3; // move to state q3 on 'a' (continuing)
                } else {
                    state = 2; // stay in q2 if any other character (middle part can be anything)
                }
                break;
            case 3: // q3: After reading 'ab' and some middle characters
                if (str[i] == 'b') {
                    state = 4; // move to state q4 on 'b' (checking for ending 'ba')
                } else {
                    state = 3; // stay in q3 if any other character
                }
                break;
            case 4: // q4: After reading 'ab...ba'
                if (str[i] == 'a') {
                    state = 4; // stay in q4 if more 'a' characters appear after 'ba'
                } else {
                    return 0; // Invalid transition, we only expect 'a' here
                }
                break;
            default:
                return 0; // Invalid state
        }
    }

    // Check if the string ends in an accepting state (q4)
    if (state == 4) {
        return 1; // Accepted
    } else {
        return 0; // Not accepted
    }
}

int main() {
    char str[100];
    
    printf("Enter a string: ");
    scanf("%s", str);
    
    // Call DFA function
    if (dfa(str)) {
        printf("The string is accepted by the DFA.\n");
    } else {
        printf("The string is not accepted by the DFA.\n");
    }
    
    return 0;
}
