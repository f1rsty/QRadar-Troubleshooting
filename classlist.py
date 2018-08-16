class Employee:

    def __init__(self, firstname, lastname, pay):
        self.first = firstname
        self.last = lastname
        self.pay = pay
        self.email = firstname + "." + lastname + "@company.com"

    def __repr__(self):
        pass

    def ShowEmail(self):
        return self.email

    def ShowFullname(self):
        return self.first + ' ' + self.last

    def AdjustPay(self, pay):
        self.pay = pay
        return self.pay

employee1 = Employee('Jason', 'Sholler', '100000')
print(employee1.pay)

newpay = employee1.AdjustPay(600000)
print(employee1.pay)

print(employee1.pay)

print(employee1.ShowEmail())