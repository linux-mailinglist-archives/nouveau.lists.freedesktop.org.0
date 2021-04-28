Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E240C36D3CE
	for <lists+nouveau@lfdr.de>; Wed, 28 Apr 2021 10:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490886EAC5;
	Wed, 28 Apr 2021 08:19:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1167 seconds by postgrey-1.36 at gabe;
 Wed, 28 Apr 2021 08:19:32 UTC
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BC46EAC5
 for <nouveau@lists.freedesktop.org>; Wed, 28 Apr 2021 08:19:31 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13S7wGNt006396; Wed, 28 Apr 2021 08:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=yKiGWIP4/+YH6mYHG15FR8yqppTY5o48IPAwFozwQLs=;
 b=ybnufCtws/FXa7tn30Bg8oaRUzlBjPtJXTteV1WcjIbdqiJBaFiHJe7PX1rQpq5viVSg
 35eP9/ed+QAcEmk52LzPHqJvc38NjYZ9jqnmkXyiSGwQ3w3C/eSwwUTEZsgYr7OSTTv1
 0qa3BRJ47t4OPQxM3byiUDoX2Sb9etGFR9fIxna7hV2OxaKEDCd6zSL39bK6XNXaEpnQ
 mZNOFw1PJTPbeVlnBpyoqTYFrbnukwVLv4uXjB7IATG5NOBGutzrZTWUMlvWojAlW0T9
 LpwmGPAt7m1cvF645360ROTMCjDJ+GCyiIccATpdLnU+b4fI4krSD/qqe7+SsBlvk3Ck hA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 385p7j92yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 08:00:03 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13S802l4003776;
 Wed, 28 Apr 2021 08:00:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 384b582chq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 08:00:02 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13S8010l003238;
 Wed, 28 Apr 2021 08:00:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 384b582c6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 08:00:00 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13S7xhn9008520;
 Wed, 28 Apr 2021 07:59:43 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 28 Apr 2021 00:59:43 -0700
Date: Wed, 28 Apr 2021 10:59:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20210428075937.GZ1959@kadam>
References: <YIAneTPoxr5n7485@mwanda>
 <CACO55tvrienoNTXmVeHnXHOEAMB0AsJdu-BexuXhe-8gMohhSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tvrienoNTXmVeHnXHOEAMB0AsJdu-BexuXhe-8gMohhSg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: mhF1oRydBq6j9HDsPY4CHyBWiRuZkrT1
X-Proofpoint-ORIG-GUID: mhF1oRydBq6j9HDsPY4CHyBWiRuZkrT1
Subject: Re: [Nouveau] [bug report] drm/nouveau/hwmon: Remove old code,
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
Cc: nouveau <nouveau@lists.freedesktop.org>, osalvador.vilardaga@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 06:04:45PM +0200, Karol Herbst wrote:
> On Wed, Apr 21, 2021 at 3:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Oscar Salvador,
> >
> > The patch bfb96e4c344e: "drm/nouveau/hwmon: Remove old code, add
> > .write/.read operations" from May 18, 2017, leads to the following
> > static checker warning:
> >
> >     drivers/gpu/drm/nouveau/nouveau_hwmon.c:507 nouveau_in_read()
> >     warn: check sign expansion for '-19'
> >     drivers/gpu/drm/nouveau/nouveau_hwmon.c:510 nouveau_in_read()
> >     warn: check sign expansion for '-19'
> >
> > drivers/gpu/drm/nouveau/nouveau_hwmon.c
> >    488  static int
> >    489  nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
> >    490  {
> >    491          struct drm_device *drm_dev = dev_get_drvdata(dev);
> >    492          struct nouveau_drm *drm = nouveau_drm(drm_dev);
> >    493          struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> >    494          int ret;
> >    495
> >    496          if (!volt)
> >    497                  return -EOPNOTSUPP;
> >    498
> >    499          switch (attr) {
> >    500          case hwmon_in_input:
> >    501                  if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> >    502                          return -EINVAL;
> >    503                  ret = nvkm_volt_get(volt);
> >    504                  *val = ret < 0 ? ret : (ret / 1000);
> >    505                  break;
> >    506          case hwmon_in_min:
> >    507                  *val = volt->min_uv > 0 ? (volt->min_uv / 1000) : -ENODEV;
> >
> > This is trying to set "*val = -ENODEV" but because "volt->min_uv" is
> > unsigned int it actually sets it to "*val = (unsigned int)-ENODEV".
> >
> > It's weird to me that this code doesn't return -ENODEV instead of
> > setting *val to it.
> >
> 
> ohh.. that might actually be a left over from the conversion we've
> done in the past. Thanks for pointing it out. Do you want to write the
> patch as well?

Sorry the delayed response.  I'm still not sure if this should return
-ENODEV or not.  Could you please fix it and give me a reported-by tag?

regards,
dan carpenter

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
