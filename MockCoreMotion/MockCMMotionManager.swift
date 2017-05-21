//
//  MockCMMotionManager.swift
//  MockCoreMotion
//
//  Created by Chunyu Ou on 3/11/17.
//  Copyright © 2017 Chunyu Ou. All rights reserved.
//

import Foundation
import CoreMotion


open class MockCMMotionManager: CMMotionManager {
    
//    var accelerometerUpdateInterval: TimeInterval { get set } This one is get and set no need to mock just call it
    
    public var _isAccelerometerAvailable: Bool?
    open override var isAccelerometerAvailable: Bool {
        get {
            return _isAccelerometerAvailable ?? super.isAccelerometerAvailable
        }
        set {
            _isAccelerometerAvailable = newValue
        }
    }
    
    /*
     *  accelerometerActive
     *
     *  Discussion:
     *			Determines whether the CMMotionManager is currently providing
     *			accelerometer updates.
     */
    public var _isAccelerometerActive: Bool?
    open override var isAccelerometerActive: Bool {
        get {
            return _isAccelerometerActive ?? super.isAccelerometerActive
        }
        set {
            _isAccelerometerActive = newValue
        }
    }

    /*
     *  accelerometerData
     *
     *  Discussion:
     *			Returns the latest sample of accelerometer data, or nil if none is available.
     */
    public var latestAccelerometerData: MockCMAccelerometerData?
    open override var accelerometerData: MockCMAccelerometerData? {
        get {
            return latestAccelerometerData
        }
        set {
            latestAccelerometerData = newValue
        }
    }
    
    /*
     *  startAccelerometerUpdates
     *
     *  Discussion:
     *			Starts accelerometer updates with no handler. To receive the latest accelerometer data
     *			when desired, examine the accelerometerData property.
     */
    public var startAccelerometerUpdatesCalled = false
    open override func startAccelerometerUpdates() {
        startAccelerometerUpdatesCalled = true
        accelerometerData = MockCMAccelerometerData.getRandomMockCMAccelerometerData()
    }
    
    //
    //
    //    /*
    //     *  startAccelerometerUpdatesToQueue:withHandler:
    //     *
    //     *  Discussion:
    //     *			Starts accelerometer updates, providing data to the given handler through the given queue.
    //     *			Note that when the updates are stopped, all operations in the
    //     *			given NSOperationQueue will be cancelled.
    //     */
    //    open func startAccelerometerUpdates(to queue: OperationQueue, withHandler handler: @escaping CoreMotion.CMAccelerometerHandler)
    //
    //
    //    /*
    //     *  stopAccelerometerUpdates
    //     *
    //     *  Discussion:
    //     *			Stop accelerometer updates.
    //     */
    //    open func stopAccelerometerUpdates()
    //
    //
    
    //    open var gyroUpdateInterval: TimeInterval has get and set no need to mock
    
    /*
     *  gyroAvailable
     *
     *  Discussion:
     *      Determines whether gyro is available.
     */
    public var _isGyroAvailable: Bool?
    open override var isGyroAvailable: Bool {
        get {
            return _isGyroAvailable ?? super.isGyroAvailable
        }
        set {
            _isGyroAvailable = newValue
        }
    }
    
    /*
     *  gyroActive
     *
     *  Discussion:
     *      Determines whether the CMMotionManager is currently providing gyro updates.
     */
    public var _isGyroActive: Bool?
    open override var isGyroActive: Bool {
        get {
            return _isGyroActive ?? super.isGyroActive
        }
        set {
            _isGyroActive = newValue
        }
    }
    
    /*
     *  gyroData
     *
     *  Discussion:
     *		Returns the latest sample of gyro data, or nil if none is available.
     */
    public var latestGyroData: MockCMGyroData?
    open override var gyroData: MockCMGyroData? {
        get {
            return latestGyroData
        }
        set {
            latestGyroData = newValue
        }
    }
    
    /*
     *  startGyroUpdates
     *
     *  Discussion:
     *			Starts gyro updates with no handler. To receive the latest gyro data
     *			when desired, examine the gyroData property.
     */
    public var isStartGyroUpdatesCalled = false
    open override func startGyroUpdates() {
        isStartGyroUpdatesCalled = true
        gyroData = MockCMGyroData.getRandomMockCMGyroData()
    }
    //
    //
    //    /*
    //     *  startGyroUpdatesToQueue:withHandler:
    //     *
    //     *  Discussion:
    //     *			Starts gyro updates, providing data to the given handler through the given queue.
    //     *			Note that when the updates are stopped, all operations in the
    //     *			given NSOperationQueue will be cancelled.
    //
    //     */
    //    open func startGyroUpdates(to queue: OperationQueue, withHandler handler: @escaping CoreMotion.CMGyroHandler)
    //
    //
    //    /*
    //     *  stopGyroUpdates
    //     *
    //     *  Discussion:
    //     *			Stops gyro updates.
    //     */
    //    open func stopGyroUpdates()
    //
    //
    
    /*
     *  magnetometerUpdateInterval
     *
     *  Discussion:
     *      The interval at which to deliver magnetometer data to the specified
     *			handler once startMagnetometerUpdatesToQueue:withHandler: is called.
     *			The units are in seconds. The value of this property is capped to
     *			certain minimum and maximum values. The maximum value is determined by
     *			the maximum frequency supported by the hardware. If sensitive to the
     *			interval of magnetometer data, an application should always check the
     *			timestamps on the delivered CMMagnetometerData instances to determine the
     *			true update interval.
     */
//    open var magnetometerUpdateInterval: TimeInterval NO NEED TO MOCK
    
    
    
    
    /*
     *  magnetometerAvailable
     *
     *  Discussion:
     *      Determines whether magetometer is available.
     */
    public var _isMagnetometerAvailable: Bool?
    open override var isMagnetometerAvailable: Bool {
        get {
            return _isMagnetometerAvailable ?? super.isMagnetometerAvailable
        }
        set {
            _isMagnetometerAvailable = newValue
        }
    }
    
    
    
    /*
     *  magnetometerActive
     *
     *  Discussion:
     *      Determines whether the CMMotionManager is currently providing magnetometer updates.
     */
    public var _isMagnetometerActive: Bool?
    open override var isMagnetometerActive: Bool {
        get {
            return _isMagnetometerActive ?? super.isMagnetometerActive
        }
        set {
            _isMagnetometerActive = newValue
        }
    }
    
    /*
     *  magnetometerData
     *
     *  Discussion:
     *      Returns the latest sample of magnetometer data, or nil if none is available.
     */
    public var latestMagnetometerData: MockCMMagnetometerData?
    open override var magnetometerData: MockCMMagnetometerData? {
        get {
            return latestMagnetometerData
        }
        set {
            latestMagnetometerData = newValue
        }
    }

    /*
     *  startMagnetometerUpdates
     *
     *  Discussion:
     *      Starts magnetometer updates with no handler. To receive the latest magnetometer data
     *          when desired, examine the magnetometerData property.
     */
    public var isStartMagnetometerUpdatesCalled = false
    open override func startMagnetometerUpdates() {
        isStartMagnetometerUpdatesCalled = true
        magnetometerData = MockCMMagnetometerData.getRandomMockCMMagnetometerData()
    }

    //
    //    /*
    //     *  startMagnetometerUpdatesToQueue:withHandler:
    //     *
    //     *  Discussion:
    //     *      Starts magnetometer updates, providing data to the given handler through the given queue.
    //     */
    //    @available(iOS 5.0, *)
    //    open func startMagnetometerUpdates(to queue: OperationQueue, withHandler handler: @escaping CoreMotion.CMMagnetometerHandler)
    //
    //
    //    /*
    //     *  stopMagnetometerUpdates
    //     *
    //     *  Discussion:
    //     *      Stops magnetometer updates.
    //     */
    //    @available(iOS 5.0, *)
    //    open func stopMagnetometerUpdates()
    //
    //
    //    /*
    //     *  deviceMotionUpdateInterval
    //     *
    //     *  Discussion:
    //     *      The interval at which to deliver device motion data to the specified
    //     *			handler once startDeviceMotionUpdatesToQueue:withHandler: is called.
    //     *			The units are in seconds. The value of this property is capped to
    //     *			certain minimum and maximum values. The maximum value is determined by
    //     *			the maximum frequency supported by the hardware. If sensitive to the
    //     *			interval of device motion data, an application should always check the
    //     *			timestamps on the delivered CMDeviceMotion instances to determine the
    //     *			true update interval.
    //     */
    //    open var deviceMotionUpdateInterval: TimeInterval NO NEED TO MOCK
    //

    /*
     *  availableAttitudeReferenceFrames
     *
     *  Discussion:
     *     Returns a bitmask specifying the available attitude reference frames on the device.
     *
     *  CMAttitudeReferenceFrame.xArbitraryZVertical.rawValue == 1
     *  CMAttitudeReferenceFrame.xArbitraryCorrectedZVertical.rawValue == 2
     *  CMAttitudeReferenceFrame.xMagneticNorthZVertical.rawValue == 4
     *  CMAttitudeReferenceFrame.xTrueNorthZVertical.rawValue == 8
     */
    public static var isAvailableAttitudeReferenceFramesCalled = false
    public static var _availableAttitudeReferenceFrames = CMAttitudeReferenceFrame(rawValue: 1)
    open override static func availableAttitudeReferenceFrames() -> CMAttitudeReferenceFrame {
        isAvailableAttitudeReferenceFramesCalled = true
        return _availableAttitudeReferenceFrames
    }
    
    /*
     *  attitudeReferenceFrame
     *
     *  Discussion:
     *		If device motion is active, returns the reference frame currently in-use.
     *		If device motion is not active, returns the default attitude reference frame
     *		for the device. If device motion is not available on the device, the value
     *		is undefined.
     *
     */
    public var currentAttitudeReferenceFrame = CMAttitudeReferenceFrame(rawValue: 2)
    public var defaultAttitudeReferenceFrame = CMAttitudeReferenceFrame(rawValue: 1)
    open override var attitudeReferenceFrame: CMAttitudeReferenceFrame {
        get {
            if isDeviceMotionActive {
                return currentAttitudeReferenceFrame
            }
            if isDeviceMotionAvailable {
                return defaultAttitudeReferenceFrame
            }
            return CMAttitudeReferenceFrame(rawValue: 10)
        }
        set {
            if isDeviceMotionActive {
                currentAttitudeReferenceFrame = newValue
            } else if !isDeviceMotionActive && isDeviceMotionAvailable {
                defaultAttitudeReferenceFrame = newValue
            }
        }
    }
    
    /*
     *  deviceMotionAvailable
     *
     *  Discussion:
     *      Determines whether device motion is available using any available attitude reference frame.
     */
    public var _isDeviceMotionAvailable: Bool?
    open override var isDeviceMotionAvailable: Bool {
        get {
            return _isDeviceMotionAvailable ?? super.isDeviceMotionAvailable
        }
        set {
            _isDeviceMotionAvailable = newValue
        }
    }
    
    /*
     *  deviceMotionActive
     *
     *  Discussion:
     *      Determines whether the CMMotionManager is currently providing device
     *			motion updates.
     */
    public var _isDeviceMotionActive: Bool?
    open override var isDeviceMotionActive: Bool {
        get {
            return _isDeviceMotionActive ?? super.isDeviceMotionActive
        }
        set {
            _isDeviceMotionActive = newValue
        }
    }
    
    /*
     *  deviceMotion
     *
     *  Discussion:
     *			Returns the latest sample of device motion data, or nil if none is available.
     */
    public var latestDeviceMotion: MockCMDeviceMotion?
    open override var deviceMotion: MockCMDeviceMotion? {
        get {
            return latestDeviceMotion
        }
        set {
            latestDeviceMotion = newValue
        }
    }
    
    /*
     *  startDeviceMotionUpdates
     *
     *  Discussion:
     *			Starts device motion updates with no handler. To receive the latest device motion data
     *			when desired, examine the deviceMotion property. Uses the default reference frame for
     *			the device. Examine CMMotionManager's attitudeReferenceFrame to determine this.
     */
    public var isStartDeviceMotionUpdatesCalled = false
    open override func startDeviceMotionUpdates() {
        isStartDeviceMotionUpdatesCalled = true
//        deviceMotion = MockCMDeviceMotion.getRandomMockCMDeviceMotion()
    }
    
    //
    //
    //    /*
    //     *  startDeviceMotionUpdatesToQueue:withHandler:
    //     *
    //     *  Discussion:
    //     *			Starts device motion updates, providing data to the given handler through the given queue.
    //     *			Uses the default reference frame for the device. Examine CMMotionManager's
    //     *			attitudeReferenceFrame to determine this.
    //     *
    //     */
    //    open func startDeviceMotionUpdates(to queue: OperationQueue, withHandler handler: @escaping CoreMotion.CMDeviceMotionHandler)
    //
    //
    //    /*
    //     *  startDeviceMotionUpdatesUsingReferenceFrame:
    //     *
    //     *  Discussion:
    //     *			Starts device motion updates with no handler. To receive the latest device motion data
    //     *			when desired, examine the deviceMotion property. The specified frame will be used as
    //     *			reference for the attitude estimates.
    //     *
    //     */
    //    @available(iOS 5.0, *)
    //    open func startDeviceMotionUpdates(using referenceFrame: CMAttitudeReferenceFrame)
    //
    //
    //    /*
    //     *  startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler
    //     *
    //     *  Discussion:
    //     *			Starts device motion updates, providing data to the given handler through the given queue.
    //     *			The specified frame will be used as reference for the attitude estimates.
    //     *
    //     */
    //    @available(iOS 5.0, *)
    //    open func startDeviceMotionUpdates(using referenceFrame: CMAttitudeReferenceFrame, to queue: OperationQueue, withHandler handler: @escaping CoreMotion.CMDeviceMotionHandler)
    //
    //
    //    /*
    //     *  stopDeviceMotionUpdates
    //     *
    //     *  Discussion:
    //     *			Stops device motion updates.
    //     */
    //    open func stopDeviceMotionUpdates()
    //
    //
    //    /*
    //     *  showsDeviceMovementDisplay
    //     *
    //     *  Discussion:
    //     *      When the device requires movement, showsDeviceMovementDisplay indicates if the system device
    //     *          movement display should be shown. Note that when device requires movement,
    //     *          CMErrorDeviceRequiresMovement is reported once via CMDeviceMotionHandler. By default,
    //     *          showsDeviceMovementDisplay is NO.
    //     */
    //    @available(iOS 5.0, *)
    //    open var showsDeviceMovementDisplay: Bool
}














