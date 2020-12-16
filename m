Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE792DC14F
	for <lists+nouveau@lfdr.de>; Wed, 16 Dec 2020 14:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC656E15E;
	Wed, 16 Dec 2020 13:31:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973D26E15E
 for <nouveau@lists.freedesktop.org>; Wed, 16 Dec 2020 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1608125487;
 bh=wJvxKbVu5Goj6d/CvAE61j8JoBUlkpdze0dLBH96NwA=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=M3ACKEvUTaZSDm+u6HiWH7yrlXZXg9eBEY6dESxXbQAxID94p8nuWWxra6Trs9YxT
 qdfPNE8ovPr6WPwtm2SQ0SmTR8E/ozkqOUBi/Yu7zAGLA+BO9orr2KmkrUOkG1iN/R
 2h0d1gRhcwDyreLXEbmRyIqSwFSqIlLYXKgOInws=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.217.61]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQe5k-1kUAIb0v5y-00NjXQ; Wed, 16
 Dec 2020 14:31:27 +0100
Message-ID: <fe612bbbeedd0ee0d03d04c7341ea62406b957c7.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: lkml <linux-kernel@vger.kernel.org>
Date: Wed, 16 Dec 2020 14:31:25 +0100
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:X0H3gZFoNt/xPoiBLfk2/uoLGovPlEDqAr+C2ALRfdQnY8AaUJ1
 Z6N7NS2BvxLJMFP8yF2v+9Ik1GOqmzxI9jfSRNDbAHGJnZBuDCWb8WgrE2TFcfr2gtr1gfC
 LEabSMvDAAe6Df7J9/XrP3mIbxkcU7wFXZxablZn+ZakbJ/+4gXaFPuJRGuJn0RskpSB25j
 bAP8uRjPMIpNKnLYUPhyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VLfXP1FbdO0=:C67pQawelYx6Xjn149Az7A
 CBYq3OpRzY/g+fWy1tBGb9g8h69dRXYwB/LUDYz71kkkvXNb5vYZktM0WlU4rX2yQoJnswREq
 zAXKNTP52Pus6E/m/V0hSmgUln3DhVQng4Na1mzSLr1ZNvUEHMVyESB+naY0/Ci4pRmVZS+/Q
 qOFH+pxkmczPqJ76NbS4ZJNQ9GIyKcEInlsXdmXc+0s8+97mNpC7VobU2OynpWPVBgmhmIAZ6
 OsYADenVrp9WCL7C/JEnHQJmfwy06t6qWTVMeP/J9KVm6OLnCW62GMjz/XIcLce4C38n17oFE
 6K+rsdsHODqle5+udtDXo5hwMExM8VLbeoCKNaMuhjWG0xcH+kZCwRzsA73m6GEDZab7GOvCz
 M1v11jKAAnDO07YPEwN6qxRo56m3/WvAdvaICNhbSlO5IwEifWpd14d5DDLc6Axn5mckTvWB3
 K49DeKgIAAItyOzcQqzpbwcJ4z2ICY58nwsRwzTzP2mivHQW1hm+H0S40doMELjnYoD1PI8fn
 a51OgnNlfyEiYrIgP6NZK8L5vmxzZgU2P2m/eh+pj6eCjQ+RQ/c2TiNp+bspjHJfPn8Po5QKz
 2qatRwmCdg2ZwGrr+X0CKKhuZp9BVB13Q257PwLjKu3lKp6TiXXmO+a5T54JjIJ1YAfVUs24w
 epjbv+eoLlCPmM/KDzKPrKJ5npcdng82ykjD0I53B8czFgNYRaaq7L/s+m/QtkCrI23H9jGjL
 3GJY7KqJ5z/D+iD+1m9mQvtrEf7shAQaEzHES5B/Taj/XMAD6d57P6FTyk+4jl3fBuhkm5I3I
 l8pDAqVyuq8IciN9XBfDei0q9drrDyGWorGJ7dO9zmTh+Q9ieVVaVAn65m/8hHXeiAK65Y4NK
 3SuJN0CvSA52jKN8tJkA==
Subject: [Nouveau] regression: nouveau fifo: fault 01 ==> channel 1: killed
 ==> dead desktop
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When the below new to 5.11 cycle badness happens, it's time to reboot.

...
[   27.467260] NFSD: Using UMH upcall client tracking operations.
[   27.467273] NFSD: starting 90-second grace period (net f00000a0)
[   27.965138] Bridge firewalling registered
[   39.096604] fuse: init (API version 7.32)
[  961.579832] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at 000000000069f000 engine 15 [CE0] client 01 [HUB/CE0] reason 02 [PTE] on channel 1 [00ff73d000 DRM]
[  961.579840] nouveau 0000:01:00.0: fifo: channel 1: killed
[  961.579844] nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
[  961.579850] nouveau 0000:01:00.0: fifo: runlist 4: scheduled for recovery
[  961.579853] nouveau 0000:01:00.0: fifo: engine 4: scheduled for recovery

Box is aging generic i4790 desktop box with...
01:00.0 VGA compatible controller: NVIDIA Corporation GM204 [GeForce GTX 980] (rev a1)

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
