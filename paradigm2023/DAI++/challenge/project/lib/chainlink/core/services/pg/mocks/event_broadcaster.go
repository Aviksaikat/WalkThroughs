// Code generated by mockery v2.28.1. DO NOT EDIT.

package mocks

import (
	context "context"

	pg "github.com/smartcontractkit/chainlink/v2/core/services/pg"
	mock "github.com/stretchr/testify/mock"
)

// EventBroadcaster is an autogenerated mock type for the EventBroadcaster type
type EventBroadcaster struct {
	mock.Mock
}

// Close provides a mock function with given fields:
func (_m *EventBroadcaster) Close() error {
	ret := _m.Called()

	var r0 error
	if rf, ok := ret.Get(0).(func() error); ok {
		r0 = rf()
	} else {
		r0 = ret.Error(0)
	}

	return r0
}

// HealthReport provides a mock function with given fields:
func (_m *EventBroadcaster) HealthReport() map[string]error {
	ret := _m.Called()

	var r0 map[string]error
	if rf, ok := ret.Get(0).(func() map[string]error); ok {
		r0 = rf()
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(map[string]error)
		}
	}

	return r0
}

// Name provides a mock function with given fields:
func (_m *EventBroadcaster) Name() string {
	ret := _m.Called()

	var r0 string
	if rf, ok := ret.Get(0).(func() string); ok {
		r0 = rf()
	} else {
		r0 = ret.Get(0).(string)
	}

	return r0
}

// Notify provides a mock function with given fields: channel, payload
func (_m *EventBroadcaster) Notify(channel string, payload string) error {
	ret := _m.Called(channel, payload)

	var r0 error
	if rf, ok := ret.Get(0).(func(string, string) error); ok {
		r0 = rf(channel, payload)
	} else {
		r0 = ret.Error(0)
	}

	return r0
}

// Ready provides a mock function with given fields:
func (_m *EventBroadcaster) Ready() error {
	ret := _m.Called()

	var r0 error
	if rf, ok := ret.Get(0).(func() error); ok {
		r0 = rf()
	} else {
		r0 = ret.Error(0)
	}

	return r0
}

// Start provides a mock function with given fields: _a0
func (_m *EventBroadcaster) Start(_a0 context.Context) error {
	ret := _m.Called(_a0)

	var r0 error
	if rf, ok := ret.Get(0).(func(context.Context) error); ok {
		r0 = rf(_a0)
	} else {
		r0 = ret.Error(0)
	}

	return r0
}

// Subscribe provides a mock function with given fields: channel, payloadFilter
func (_m *EventBroadcaster) Subscribe(channel string, payloadFilter string) (pg.Subscription, error) {
	ret := _m.Called(channel, payloadFilter)

	var r0 pg.Subscription
	var r1 error
	if rf, ok := ret.Get(0).(func(string, string) (pg.Subscription, error)); ok {
		return rf(channel, payloadFilter)
	}
	if rf, ok := ret.Get(0).(func(string, string) pg.Subscription); ok {
		r0 = rf(channel, payloadFilter)
	} else {
		if ret.Get(0) != nil {
			r0 = ret.Get(0).(pg.Subscription)
		}
	}

	if rf, ok := ret.Get(1).(func(string, string) error); ok {
		r1 = rf(channel, payloadFilter)
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}

type mockConstructorTestingTNewEventBroadcaster interface {
	mock.TestingT
	Cleanup(func())
}

// NewEventBroadcaster creates a new instance of EventBroadcaster. It also registers a testing interface on the mock and a cleanup function to assert the mocks expectations.
func NewEventBroadcaster(t mockConstructorTestingTNewEventBroadcaster) *EventBroadcaster {
	mock := &EventBroadcaster{}
	mock.Mock.Test(t)

	t.Cleanup(func() { mock.AssertExpectations(t) })

	return mock
}
