# LOCAL SERVER SETUP

```bash
bundle && rails s
```

# APIs

## Create a friend connection between two email addresses

```bash
curl -d '{"friends":["andy@example.com","john@example.com"]}' -H "Content-Type: application/json" -X POST http://localhost:3000/friendships
```

## Retrieve the friends list for an email address

```bash
curl -d '{"email":"andy@example.com"}' -H "Content-Type: application/json" -X GET http://localhost:3000/friends
```

## Retrieve the common friends list between two email addresses

```bash
curl -d '{"friends":["andy@example.com","john@example.com"]}' -H "Content-Type: application/json" -X GET http://localhost:3000/common_friends
```

## Subscribe to updates from an email address

```bash
curl -d '{"requestor":"lisa@example.com","target":"john@example.com"}' -H "Content-Type: application/json" -X POST http://localhost:3000/subscriptions
```

## Block updates from an email address

```bash
curl -d '{"requestor":"andy@example.com","target":"john@example.com"}' -H "Content-Type: application/json" -X POST http://localhost:3000/blacklists
```

## Retrieve all email addresses that can receive updates from an email address

```bash
curl -d '{"sender":"john@example.com","text":"Hello World! kate@example.com"}' -H "Content-Type: application/json" -X GET http://localhost:3000/updates
```