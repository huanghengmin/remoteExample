// IOpenVPNAPIService.aidl
package com.zd.vpn.api;

import com.zd.vpn.api.APIVpnProfile;
import com.zd.vpn.api.IOpenVPNStatusCallback;

import android.content.Intent;
import android.os.ParcelFileDescriptor;

interface IOpenVPNAPIService {
	List<APIVpnProfile> getProfiles();
	
	void startProfile (String profileUUID);
	
	/** Use a profile with all certificates etc. embedded */
	boolean addVPNProfile (String name, String config);
	
	/** start a profile using an config */
	void startVPN (String inlineconfig);
	
	/** This permission framework is used  to avoid confused deputy style attack to the VPN
	 * calling this will give null if the app is allowed to use the external API and an Intent
	 * that can be launched to request permissions otherwise */
	Intent prepare (String packagename);
	
	/** Used to trigger to the Android VPN permission dialog (VPNService.prepare()) in advance,
	 * if this return null OpenVPN for ANdroid already has the permissions otherwise you can start the returned Intent
	 * to let OpenVPN for Android request the permission */
	Intent prepareVPNService ();

	/* Disconnect the VPN */
    void disconnect();

    /* Pause the VPN (same as using the pause feature in the notifcation bar) */
    void pause();

    /* Resume the VPN (same as using the pause feature in the notifcation bar) */
    void resume();
    
    /**
      * Registers to receive OpenVPN Status Updates
      */
    void registerStatusCallback(IOpenVPNStatusCallback cb);
    
    /**
     * Remove a previously registered callback interface.
     */
    void unregisterStatusCallback(IOpenVPNStatusCallback cb);

	 //启动
     String startZDVPN();

     //停止
     void stopZDVPN();

     //初始化
     boolean init(String ip, int port, int strategyPort, String pinCode, String container, boolean tcpudp);

    //获取证书
     String[] loadCert();

}