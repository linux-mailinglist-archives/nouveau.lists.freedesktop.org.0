Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A6372965
	for <lists+nouveau@lfdr.de>; Tue,  4 May 2021 13:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFC36E1DE;
	Tue,  4 May 2021 11:04:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 04 May 2021 11:04:57 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CD66E1DE
 for <nouveau@lists.freedesktop.org>; Tue,  4 May 2021 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620126296;
 bh=f6Wb03GX+/WT+gqinbeNFjDuW6Zsxxv6ZGVE6wBU+hI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=eN1B+xliDmz4Y6UkkQo5dhaO9Dyp7IW5a2LDnD2V9ZaLxx+o2CQCW0+4BYYkKWRir
 3gra4mFz5XwJw2JJtlwaEKDnJTPreAZKjpWVFl9T5xQFHE5OOVIXDSVVfx9g71VGj2
 gV8kd43yaqUHUshTNrI0kdqaI/gOLcZL1Fh8kGq0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [212.51.190.238] ([212.51.190.238]) by web-mail.gmx.net
 (3c-app-mailcom-bs08.server.lan [172.19.170.176]) (via HTTP); Tue, 4 May
 2021 12:59:51 +0200
MIME-Version: 1.0
Message-ID: <trinity-17fe43f4-11a7-47e4-851d-58f289eeb183-1620125991492@3c-app-mailcom-bs08>
From: Samuel VISCAPI <sviscapi@gmx.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 4 May 2021 12:59:51 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:EmJrKJ6CsEYPX44ZeqASVoDNSk5iDQyFb3Mdh6zR8h8QcHdaJbjNQc4mk/qFNKJOqczWH
 vlYxyV5QmXmuUrgQc6mscqVEQkf1aXy/OOXFvCoXhF/7ozhWVOnZNLaBIDJox4Bii9ycDvkXQ75I
 78/MI7Zv5FUN1h++6uHuo+9+AM4DBRnnYXRGNXYSfMIL70GdhoHMWAUkA1E47PRpSMAt3CZoYAz6
 dCiyGfsPvDQwra9a8URBKBkeJ3P0by+3TtbaaKHWGazUiTV7GaqXlYmI13uGhLsaYJecNoMI4P5y
 tM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7rLnj0hh5JA=:RKGFUBrCOI0cj0kEC/g0AI
 cpq0FMU3BZzrBO+mbBm2z2F+t9WKJainIpWo3VUOU+Mo+sOEIXXP4Mv2BLIWIK3aJx+hUitEj
 uRvTT51pKsmTzV5xT8C1irhJ6wPYBvKOE0gXYGpZykztf/d7qH+4Qw5h0VItd6s2YItmdglq2
 rpjRl1AHWIAbOaqj87/M9q2YbeH0Fa0AOwkPjYWaf6cDWFOnHbPiSLyGIzV2ZcRVCULsiOuG/
 LZUObLRX3+ovNZDZTyfh83ox9sGi88cg0YGadx8oF8k8vzfhKSo+8ufl25BygoUxarN5suoU9
 NnWRnxdHbSy/U57u/Il3UyYVh/qP7zE9h5shoP5VT++xgNfkTiMRiXKgWVo6Y/fvGxEYkWrqW
 Hi9wssDtNJzeBvBlqZpAcdOu+RR9dP5ROgOfuKC7rTTbSnIPCGyXVs9fByjo7qriePJSW6x7g
 lYngatAPMvy0PgnYjtWImEiT5sAcC59F9zt4opIKJ2nZ3xKtj97nBDO1XUiBRClPSdOPIxqgt
 qFb0EH3duxcRV/L8dLR8Qv5ipBRTYSpxBDsdHAVneyG4nG6lw+q6N8/juNxZ7P5WkzJcD26/u
 Sn8yPYVdNrqzhb2rIGfLq38FViBEMyDxaCh3jXllH6c6V28JLSqTsf+QYRRx+vYQKFoSrOrGQ
 EPXaYHZcfhZeA8LEYHnAh8ZALKd2qhnTBeAOgRCgJ6y8ppSOqqFLyHGEvePAMMXb3mVRG65+P
 6gGIcpt6IGOwYNgREJsERuj37CTOsI56kZgSU/RUA3IKxfS6IAu7+YaEEmCFRk5410fBoqppk
 GdGEabXylHiMwu3tSBT/TXac9m2rfD2PULC7cfWR0gK4/IkYVE8/XJXa9JDofV8vue3LwnwvM
 7N7VQz8DAwZPbo9E/ccgDokHc3DRPFqRw9IRGUvXUvhbPRsPs/KndRfDvj7hNP
Subject: [Nouveau] [Donation] NVidia 8800M GTX
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
Content-Type: multipart/mixed; boundary="===============1213696578=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1213696578==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Dear all,</div>

<div>&nbsp;</div>

<div>@Samuel Pitoiset: would you still be interested in an NVidia 8800M GTX ?</div>

<div>&nbsp;</div>

<div>https://nouveau.freedesktop.org/HardwareDonations.html</div>

<div>&nbsp;</div>

<div>I just replaced my 2006/2007 laptop and I&#39;m willing to donate the GPU to the Nouveau driver community.</div>

<div>&nbsp;</div>

<div>Best regards,</div>

<div>&nbsp;</div>

<div>An other Samuel ;)</div></div></body></html>

--===============1213696578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1213696578==--
