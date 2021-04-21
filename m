Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEEA366D5D
	for <lists+nouveau@lfdr.de>; Wed, 21 Apr 2021 15:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F7E6E1F9;
	Wed, 21 Apr 2021 13:57:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1977 seconds by postgrey-1.36 at gabe;
 Wed, 21 Apr 2021 13:57:19 UTC
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E866E1F9
 for <nouveau@lists.freedesktop.org>; Wed, 21 Apr 2021 13:57:19 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDLNAa029005; Wed, 21 Apr 2021 13:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=O8webnG6Ih+IJteyYF/I4uxEf3uFO80YIIXVsB1Qyt0=;
 b=lHCC5HTsb36oYqGBZ/8r+Ithhl5awZCW+2Zp8Rf4Kbkrepu1PXNRnubc0nYIpvvlWYqt
 KleS3SWHxV3UBr3PX3wmFyhTuxmT8/T5VVbrG6WI/hLPB0MjawE/+Kn2ce2PRCZ6rvGB
 F1W8sMrWCJH6H5BwZNC0wPh2LTpSzOy4oXoLfRLaY7D3t9jh7ia0avWefmNRXjDq3epn
 FcjE2zYN0SLf9o6ylhmYrG1UGVS64RESi2614kWuHkYaGju/Ia3L+1bpQI76Us7uupoB
 UynB5MI7AaYCjUxww7h+41YwDcLDOu/3i8RBHyy3DYgq05xNc313bGnZi9pOgBN2M6+O dQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 381tw0ghc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:24:20 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDM8eR185500;
 Wed, 21 Apr 2021 13:24:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809eu91g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:24:18 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDOIbq192255;
 Wed, 21 Apr 2021 13:24:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3809eu91fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:24:18 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13LDOHf0026533;
 Wed, 21 Apr 2021 13:24:17 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 13:24:16 +0000
Date: Wed, 21 Apr 2021 16:24:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: osalvador.vilardaga@gmail.com
Message-ID: <YIAneTPoxr5n7485@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-GUID: RCY3N5YlO-zXh8u-3aXRQLtKgexjiP5U
X-Proofpoint-ORIG-GUID: RCY3N5YlO-zXh8u-3aXRQLtKgexjiP5U
Subject: [Nouveau] [bug report] drm/nouveau/hwmon: Remove old code,
 add .write/.read operations
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Oscar Salvador,

The patch bfb96e4c344e: "drm/nouveau/hwmon: Remove old code, add
.write/.read operations" from May 18, 2017, leads to the following
static checker warning:

    drivers/gpu/drm/nouveau/nouveau_hwmon.c:507 nouveau_in_read()
    warn: check sign expansion for '-19'
    drivers/gpu/drm/nouveau/nouveau_hwmon.c:510 nouveau_in_read()
    warn: check sign expansion for '-19'

drivers/gpu/drm/nouveau/nouveau_hwmon.c
   488  static int
   489  nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
   490  {
   491          struct drm_device *drm_dev = dev_get_drvdata(dev);
   492          struct nouveau_drm *drm = nouveau_drm(drm_dev);
   493          struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
   494          int ret;
   495  
   496          if (!volt)
   497                  return -EOPNOTSUPP;
   498  
   499          switch (attr) {
   500          case hwmon_in_input:
   501                  if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
   502                          return -EINVAL;
   503                  ret = nvkm_volt_get(volt);
   504                  *val = ret < 0 ? ret : (ret / 1000);
   505                  break;
   506          case hwmon_in_min:
   507                  *val = volt->min_uv > 0 ? (volt->min_uv / 1000) : -ENODEV;

This is trying to set "*val = -ENODEV" but because "volt->min_uv" is
unsigned int it actually sets it to "*val = (unsigned int)-ENODEV".

It's weird to me that this code doesn't return -ENODEV instead of
setting *val to it.

   508                  break;
   509          case hwmon_in_max:
   510                  *val = volt->max_uv > 0 ? (volt->max_uv / 1000) : -ENODEV;
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   511                  break;
   512          default:
   513                  return -EOPNOTSUPP;
   514          }
   515  
   516          return 0;
   517  }

regards,
dan carpenter
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
