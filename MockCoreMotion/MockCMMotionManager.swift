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
            return _isAccelerometerAvailable ?? super.isAccelerometerAvailable
        }
        set {
            _isAccelerometerAvailable = newValue
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
        latestAccelerometerData = MockCMAccelerometerData.getRandomMockCMAccelerometerData()
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
    
    //
    //    /*
    //     *  gyroData
    //     *
    //     *  Discussion:
    //     *		Returns the latest sample of gyro data, or nil if none is available.
    //     */
    //    open var gyroData: CMGyroData? { get }
    //
    //
    //    /*
    //     *  startGyroUpdates
    //     *
    //     *  Discussion:
    //     *			Starts gyro updates with no handler. To receive the latest gyro data
    //     *			when desired, examine the gyroData property.
    //     */
    //    open func startGyroUpdates()
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
    //    /*
    //     *  magnetometerUpdateInterval
    //     *
    //     *  Discussion:
    //     *      The interval at which to deliver magnetometer data to the specified
    //     *			handler once startMagnetometerUpdatesToQueue:withHandler: is called.
    //     *			The units are in seconds. The value of this property is capped to
    //     *			certain minimum and maximum values. The maximum value is determined by
    //     *			the maximum frequency supported by the hardware. If sensitive to the
    //     *			interval of magnetometer data, an application should always check the
    //     *			timestamps on the delivered CMMagnetometerData instances to determine the
    //     *			true update interval.
    //     */
    //    @available(iOS 5.0, *)
    //    open var magnetometerUpdateInterval: TimeInterval
    //
    //
    //    /*
    //     *  magnetometerAvailable
    //     *
    //     *  Discussion:
    //     *      Determines whether magetometer is available.
    //     */
    //    @available(iOS 5.0, *)
    //    open var isMagnetometerAvailable: Bool { get }
    //
    //
    //    /*
    //     *  magnetometerActive
    //     *
    //     *  Discussion:
    //     *      Determines whether the CMMotionManager is currently providing magnetometer updates.
    //     */
    //    @available(iOS 5.0, *)
    //    open var isMagnetometerActive: Bool { get }
    //
    //
    //    /*
    //     *  magnetometerData
    //     *
    //     *  Discussion:
    //     *      Returns the latest sample of magnetometer data, or nil if none is available.
    //     */
    //    @available(iOS 5.0, *)
    //    open var magnetometerData: CMMagnetometerData? { get }
    //
    //
    //    /*
    //     *  startMagnetometerUpdates
    //     *
    //     *  Discussion:
    //     *      Starts magnetometer updates with no handler. To receive the latest magnetometer data
    //     *          when desired, examine the magnetometerData property.
    //     */
    //    @available(iOS 5.0, *)
    //    open func startMagnetometerUpdates()
    //
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
    //    open var deviceMotionUpdateInterval: TimeInterval
    //
    //
    //    /*
    //     *  availableAttitudeReferenceFrames
    //     *
    //     *  Discussion:
    //     *     Returns a bitmask specifying the available attitude reference frames on the device.
    //     */
    //    @available(iOS 5.0, *)
    //    open class func availableAttitudeReferenceFrames() -> CMAttitudeReferenceFrame
    //
    //
    //    /*
    //     *  attitudeReferenceFrame
    //     *
    //     *  Discussion:
    //     *		If device motion is active, returns the reference frame currently in-use.
    //     *		If device motion is not active, returns the default attitude reference frame
    //     *		for the device. If device motion is not available on the device, the value
    //     *		is undefined.
    //     *
    //     */
    //    @available(iOS 5.0, *)
    //    open var attitudeReferenceFrame: CMAttitudeReferenceFrame { get }
    //
    //
    //    /*
    //     *  deviceMotionAvailable
    //     *
    //     *  Discussion:
    //     *      Determines whether device motion is available using any available attitude reference frame.
    //     */
    //    open var isDeviceMotionAvailable: Bool { get }
    //
    //
    //    /*
    //     *  deviceMotionActive
    //     *
    //     *  Discussion:
    //     *      Determines whether the CMMotionManager is currently providing device
    //     *			motion updates.
    //     */
    //    open var isDeviceMotionActive: Bool { get }
    //
    //
    //    /*
    //     *  deviceMotion
    //     *
    //     *  Discussion:
    //     *			Returns the latest sample of device motion data, or nil if none is available.
    //     */
    //    open var deviceMotion: CMDeviceMotion? { get }
    //
    //
    //    /*
    //     *  startDeviceMotionUpdates
    //     *
    //     *  Discussion:
    //     *			Starts device motion updates with no handler. To receive the latest device motion data
    //     *			when desired, examine the deviceMotion property. Uses the default reference frame for
    //     *			the device. Examine CMMotionManager's attitudeReferenceFrame to determine this.
    //     */
    //    open func startDeviceMotionUpdates()
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














