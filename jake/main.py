import datetime

__version__ = "0.1.0"


def main() -> None:
    current_time = datetime.datetime.now().isoformat()
    print(f"Hello World, now is {current_time}")


if __name__ == "__main__":
    main()
