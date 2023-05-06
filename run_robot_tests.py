import subprocess

def run_robot_tests():
    command = "robot --outputdir results --output output.xml --output log.html --output report.html ./tests/login.robot"
    subprocess.call(command, shell=True)

if __name__ == "__main__":
    run_robot_tests()
