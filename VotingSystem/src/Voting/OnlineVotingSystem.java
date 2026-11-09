package Voting;
import java.util.*;

public class OnlineVotingSystem {
    static Map<String, User> users = new HashMap<>();
    static Map<String, Boolean> hasVoted = new HashMap<>();
    static Map<String, Candidate> candidates = new HashMap<>();
    static Map<String, Integer> candidateVotes = new HashMap<>();
    static String loggedInUser = null;
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        addCandidate("Alice");
        addCandidate("Bob");
        addCandidate("Charlie");
        System.out.println("===== College Online Voting System =====");
        while (true) {
            try {
                System.out.println("\n1.Register  2.Login  3.Candidate List  4.Cast Vote  "
                		+ "5.View Total Votes  6.Result  7.Exit");
                System.out.print("Choose: ");
                int choice = Integer.parseInt(sc.nextLine());
                switch (choice) {
                    case 1: register(); break;
                    case 2: login(); break;
                    case 3: showCandidates(); break;
                    case 4: castVote(); break;
                    case 5: viewTotalVotes(); break;
                    case 6: showResult(); break;
                    case 7: System.out.println("Thank you!"); return;
                    default: System.out.println("Invalid choice!");
                }
            } catch (Exception e) {
                System.out.println("Invalid input! Please enter number only.");
            }
        }
    }

    static void addCandidate(String name) {
        candidates.put(name, new Candidate(name));
        candidateVotes.put(name, 0);
    }

    static void register() {
        System.out.print("Enter new username: ");
        String uname = sc.nextLine();
        if (users.containsKey(uname)) { System.out.println("User already exists!"); return; }
        System.out.print("Enter password: ");
        String pwd = sc.nextLine();
        users.put(uname, new User(uname, pwd));
        hasVoted.put(uname, false);
        System.out.println("Registration successful!");
    }

    static void login() {
        System.out.print("Username: "); String uname = sc.nextLine();
        System.out.print("Password: "); String pwd = sc.nextLine();
        if (users.containsKey(uname) && users.get(uname).password.equals(pwd)) {
            loggedInUser = uname;
            System.out.println("Login successful! Welcome " + uname);
        } else { System.out.println("Invalid credentials!"); }
    }

    static void showCandidates() {
        System.out.println("----- Candidate List -----");
        for (String c : candidates.keySet()) System.out.println("- " + c);
    }

    static void castVote() {
        if (loggedInUser == null) { System.out.println("Please login first!"); return; }
        if (hasVoted.get(loggedInUser)) {
            System.out.println("You have already voted! Cannot vote again.");
            return;
        }
        showCandidates();
        System.out.print("Enter candidate name to vote: ");
        String name = sc.nextLine();
        if (candidateVotes.containsKey(name)) {
            candidateVotes.put(name, candidateVotes.get(name) + 1);
            candidates.get(name).votes++;
            hasVoted.put(loggedInUser, true);
            System.out.println("Vote casted successfully for " + name + "!");
        } else { System.out.println("Invalid candidate name!"); }
    }

    static void viewTotalVotes() {
        System.out.println("----- Total Votes -----");
        for (Map.Entry<String, Integer> e : candidateVotes.entrySet()) {
            System.out.println(e.getKey() + " : " + e.getValue() + " votes");
        }
    }

    static void showResult() {
        String winner = null, runnerUp = null;
        int max = -1, secondMax = -1;
        for (Map.Entry<String, Integer> e : candidateVotes.entrySet()) {
            int v = e.getValue();
            if (v > max) { secondMax = max; runnerUp = winner; max = v; winner = e.getKey(); }
            else if (v > secondMax) { secondMax = v; runnerUp = e.getKey(); }
        }
        System.out.println("\n===== FINAL RESULT =====");
        System.out.println("WINNER (Finalist): " + winner + " with " + max + " votes");
        System.out.println("RUNNER-UP: " + runnerUp + " with " + secondMax + " votes");
    }
}