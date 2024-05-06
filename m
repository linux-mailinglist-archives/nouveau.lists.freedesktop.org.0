Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABACCBA979
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364AE10E9E7;
	Sat, 13 Dec 2025 12:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=danm.net header.i=@danm.net header.b="ZmkTZQBL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Mon, 06 May 2024 18:29:26 UTC
Received: from ci74p00im-qukt09081701.me.com (ci74p00im-qukt09081701.me.com
 [17.57.156.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9400910E6BB
 for <nouveau@lists.freedesktop.org>; Mon,  6 May 2024 18:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danm.net; s=sig1;
 t=1715019816; bh=k+qzt2+1Ia9zMIU6NU5FMS2XCDvlIMA5wroIBSQ6VMg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=ZmkTZQBLK7+7+ble07oCEGknBzkFqgnEPgM5kh2sb6pBDGjAi1YHaSIqXL/+E3lQU
 /qHlWq+cm5NFlwM81t2noUDAbxcGcjdqK8RseIXIecxEcPOBOkNC7haqe0m4T2yvdO
 ppMQ1URbR0FNo83htwM9pc8f9pZXzus/2EeNiz0rqL8dYsZMslpEr55uPyhc4JlEDG
 wkEQxjjm/wiTq7gKnw8yHU3HCBFwnspjz420Z5znybc+7Bz22wNw5aNIP8RVpKyXpT
 ral6ePCH86Sh4I64ZxtlkDFHmu/0P5sN9YcN/VyvNX1IzuS8ug+EuwnAVHPT6vR8s9
 kZazWFBrS9F1Q==
Received: from hitch.danm.net (ci77p00im-dlb-asmtp-mailmevip.me.com
 [17.57.156.26])
 by ci74p00im-qukt09081701.me.com (Postfix) with ESMTPSA id 74F7A46C044E;
 Mon,  6 May 2024 18:23:34 +0000 (UTC)
From: Dan Moulding <dan@danm.net>
To: nouveau@lists.freedesktop.org
Cc: kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, dan@danm.net
Subject: [REGRESSION] v6.9-rc7: nouveau: init failed, no display output from
 kernel; successfully bisected
Date: Mon,  6 May 2024 12:23:31 -0600
Message-ID: <20240506182331.8076-1-dan@danm.net>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wz54LpTPKS3QRQ1x9J7c7q5aezbmJrMd
X-Proofpoint-ORIG-GUID: Wz54LpTPKS3QRQ1x9J7c7q5aezbmJrMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1030
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=844 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2405060132
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

After upgrading to rc7 from rc6 on a system with NVIDIA GP104 using
the nouveau driver, I get no display output from the kernel (only the
output from GRUB shows on the primary display). Nonetheless, I was
able to SSH to the system and get the kernel log from dmesg. I found
errors from nouveau in it. Grepping it for nouveau gives me this:

[    0.367379] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
[    0.474499] nouveau 0000:01:00.0: bios: version 86.04.50.80.13
[    0.474620] nouveau 0000:01:00.0: pmu: firmware unavailable
[    0.474977] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
[    0.484371] nouveau 0000:01:00.0: sec2(acr): mbox 00000001 00000000
[    0.484377] nouveau 0000:01:00.0: sec2(acr):load: boot failed: -5
[    0.484379] nouveau 0000:01:00.0: acr: init failed, -5
[    0.484466] nouveau 0000:01:00.0: init failed with -5
[    0.484468] nouveau: DRM-master:00000000:00000080: init failed with -5
[    0.484470] nouveau 0000:01:00.0: DRM-master: Device allocation failed: -5
[    0.485078] nouveau 0000:01:00.0: probe with driver nouveau failed with error -50

I bisected between v6.9-rc6 and v6.9-rc7 and that identified commit
52a6947bf576 ("drm/nouveau/firmware: Fix SG_DEBUG error with
nvkm_firmware_ctor()") as the first bad commit. I then rebuilt
v6.9-rc7 with just that commit reverted and the problem does not
occur.

Please let me know if there are any additional details I can provide
that would be helpful, or if I should reproduce the failure with
additional debugging options enabled, etc.

Cheers,

-- Dan
