using ConsoleApp41.Models;
using ConsoleApp41.Data;

EventDao eventDao = new();
SpeakerDao speakerDao = new();
string? option;
do {
    ShowMenu();
    option = Console.ReadLine();
    switch(option) {
        case "1":
            Console.WriteLine("Create Event");
            Event newEvent = CreateEvent();
            eventDao.Create(newEvent);
            break;
        case "2":
            Console.WriteLine("Create Speaker");
            Speaker newSpeaker = CreateSpeaker();
            speakerDao.Create(newSpeaker);
            break;
        case "3":
            Console.WriteLine("Read Event");
            Console.Write("Id: ");
            int id = int.Parse(Console.ReadLine());
            Event readEvent = eventDao.Read(id);
            Console.WriteLine(readEvent);
            break;
        case "4":
            Console.WriteLine("Read Speaker");
            Console.Write("Id: ");
            id = int.Parse(Console.ReadLine());
            Speaker readSpeaker = speakerDao.Read(id);
            Console.WriteLine(readSpeaker);
            break;
        case "5":
            Console.WriteLine("Update Event");
            Console.Write("Id: ");
            id = int.Parse(Console.ReadLine());
            Event updateEvent = CreateEvent();
            break;
        case "6":
            Console.WriteLine("Update Speaker");
            break;
        case "7":
            Console.WriteLine("Delete Event");
            break;
        case "8":
            Console.WriteLine("Delete Speaker");
            break;
        case "0":
            Console.WriteLine("Exit");
            break;
        default:
            Console.WriteLine("Invalid Option");
            break;
    }
} while(option != "0");

static void ShowMenu() {
    Console.WriteLine("1. Create Event");
    Console.WriteLine("2. Create Speaker");
    Console.WriteLine("3. Read Evemt");
    Console.WriteLine("4. Read Speaker");
    Console.WriteLine("5. Update Event");
    Console.WriteLine("6. Update Speaker");
    Console.WriteLine("7. Delete Event");
    Console.WriteLine("8. Delete Speaker");
    Console.WriteLine("5. Exit");
}

static Event CreateEvent() {
    Event newEvent = new();
    Console.Write("Name: ");
    newEvent.Name = Console.ReadLine();
    Console.Write("Description: ");
    newEvent.Description = Console.ReadLine();
    Console.Write("Address: ");
    newEvent.Address = Console.ReadLine();
    Console.Write("Start Date: ");
    newEvent.StartDate = DateTime.Parse(Console.ReadLine());
    Console.Write("Start Time: ");
    newEvent.StartTime = DateTime.Parse(Console.ReadLine());
    Console.Write("End Time: ");
    newEvent.EndTime = DateTime.Parse(Console.ReadLine());
    return newEvent;
}

static Speaker CreateSpeaker() {
    Speaker newSpeaker = new();
    Console.Write("Full Name: ");
    newSpeaker.FullName = Console.ReadLine();
    Console.Write("Position: ");
    newSpeaker.Position = Console.ReadLine();
    Console.Write("Company: ");
    newSpeaker.Company = Console.ReadLine();
    Console.Write("Image URL: ");
    newSpeaker.ImageUrl = Console.ReadLine();
    return newSpeaker;
}
