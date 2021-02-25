Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128053259BB
	for <lists+nouveau@lfdr.de>; Thu, 25 Feb 2021 23:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2B36E09E;
	Thu, 25 Feb 2021 22:40:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4566E09E
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 22:40:25 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id s15so5425271qtq.0
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 14:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=/vp0J8i6xz9SzJok9ei35ADLEF0OUNZh/Oc5lVsDWSc=;
 b=PqQSb6Sr6d+kJ3PEZzezWhd4Q1o2cvkSKPUvdX57KsngiYUP5TGl5W3fWKxvF1IdNs
 vbHwssBiuciV9EvwvRCUYKa04ZNQarm9Dc0QsqQoldpDLM7RI9Ib/drzmvF0bKJ9lWqn
 mgK/V0Hu+TzZm1aUEMAJTL3ohEbajOxWPMqr3IHdLCv4ueB9yK0IEccoWSDeFzGLZVl3
 I3unguIeYD4ZA2Uj74rb2UiJsERgiVxXK0HUqmHkcXmXHDVFgVHsa9QUafPR372y4Zh9
 RsfNegkCMUZMbUM3MQ/IUqobHYpywcPiFDRWDvlaOn4StBox423v/vjMh8Wlgr65Nyet
 84BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=/vp0J8i6xz9SzJok9ei35ADLEF0OUNZh/Oc5lVsDWSc=;
 b=foAyaqv9r1OmGSqf6HJo5lRvBXXCgPGeNmuVoKsgExq6XGAFKbNddvumgl+TgHuuqW
 Md8Wy4cRBLAjMgDVbmdwuitmK3y8yrzS2DEyQp5LBRhbuyjdoy9E0Oyl4APTdv+fPjVB
 d0Ej/FEMq7Lc//5SVSA7UX2Q/tYWRGZ5i68r4pp3Io3bh/ZIeVFA6lZIVJhsaa7lo0R7
 PIfhSgGNeUkmjOTyt6OMgbrer8RsOL+Gx7syhZC86xd1oJA5xQa/wkzo+GQUzdVoPUQI
 VdFahO48cD/AmOF8TEzal45c38nvrj3pdIaYQ9mN/GwFGabCmcg0cHn6IeFQhBjUIH7F
 +ZYQ==
X-Gm-Message-State: AOAM533uio84garKV4WhHpoNAHEXSTvbSHTZ0Os73/JOUDhnOnbrHQ5i
 DHA4pm2Y3Tuv9k/sniU1N+3FWJHa+8/+rg==
X-Google-Smtp-Source: ABdhPJylZL6me6RCkUEn0mcnw9mlb23zfumewp4OWCRjSSbErKsPdEFKrEKTMFfTguZp/1Rz/m0gqQ==
X-Received: by 2002:ac8:6b57:: with SMTP id x23mr340779qts.278.1614292823795; 
 Thu, 25 Feb 2021 14:40:23 -0800 (PST)
Received: from localhost4.local (h21.167.133.40.static.ip.windstream.net.
 [40.133.167.21])
 by smtp.gmail.com with ESMTPSA id 82sm5153524qkd.48.2021.02.25.14.40.23
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 14:40:23 -0800 (PST)
Date: Thu, 25 Feb 2021 17:40:22 -0500
From: Roger <rogerx.oss@gmail.com>
To: nouveau@lists.freedesktop.org
Message-ID: <YDgnVpKo8ya8WRAF@localhost4.local>
MIME-Version: 1.0
Content-Disposition: inline
X-PGP-Key: http://rogerx.sdf.org/about/armor-F515AC1F231FFC4EF0BCDE7606CEA0ECE2887C75-20170104.asc
Subject: [Nouveau] i2c-dev driver corrupts display?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

HARDWARE:
Dell Inspiron 8100 laptop
nVIDIA Geforce2 Go (NV11) with Intel AGP

PROBLEM:
Display corruption whenever nouveau module was loaded, seemingly at random.

CULPRIT:
Whenever the i2c-dev.ko driver/module was loaded, the display would become 
corrupted, or as if the timing became out of sync with hardware specifications, 
with weird moving pixels throughout the display.

If the i2c-dev is built into the kernel, possible the display would turn-off 
upon nouveau module loading, but could be possibly worked around (I think) by 
building the nouveau driver statically into the kernel, possibly loading prior 
to i2c-dev loading?

Been having this problem for many years, finally found it, and nothing found 
via Google on i2c-dev & nouveau.

WORKAROUND:
/etc/modprobe.d/blacklist.conf
blacklist i2c_dev

Or, rebuild the kernel without i2c-dev.

Quite a few Linux distributions either compile the i2c-dev into the kernel, or 
load the module during booting, creating significant display problems (as noted 
above) when trying to install from a Linux distribution CD/DVD.  Most people 
performing an install, I'm guessing, are then simply performing a nomodeset 
during boot and/or reverting to VESA/UVESAFB.


-- 
Roger
http://rogerx.sdf.org/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
