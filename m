Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA5CBA973
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EB410E9A9;
	Sat, 13 Dec 2025 12:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=danm.net header.i=@danm.net header.b="QROozGPc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Mon, 06 May 2024 19:07:24 UTC
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com
 [17.58.23.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619AE10FF56
 for <nouveau@lists.freedesktop.org>; Mon,  6 May 2024 19:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danm.net; s=sig1;
 t=1715021953; bh=5IIESbR3d7PDTj2PZkx/M3SXR6EBw4Yas+xIOzHKpLQ=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=QROozGPcQ1BDbPD4y28JbBRKN8LWKB27xIcPMiaIEh+VN6WaolzSOcdjbnDSIukAL
 t6vMVFJukvGFtLxk8qgKXEeAgaTPfGZoGgBi+TcXLL8hJq/SDyCx2N+uLjwbwkSgmT
 QnER8wQqp//NHU/DPf//zMscGt/buGwifowkoi5xdc2irEjFK8Lz4PP4Zzgn9aYmRF
 ZzQCPbI3zsqY/itae2MjQ9r2LIJDSKEf03n+whJHakELkm4ejMtPRK501D1pqXwhnF
 DvCMxnbYiigPoKJnM3GkcG8XFZXpbKHhv0uuvc3mQmXxCMxVLZFjHeZwgw0EI5RMwj
 YNKT6MShzmirQ==
Received: from hitch.danm.net (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id 47DD61349F79;
 Mon,  6 May 2024 18:59:12 +0000 (UTC)
From: Dan Moulding <dan@danm.net>
To: dan@danm.net
Cc: airlied@redhat.com, dakr@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] v6.9-rc7: nouveau: init failed, no display output
 from kernel; successfully bisected
Date: Mon,  6 May 2024 12:59:10 -0600
Message-ID: <20240506185910.17917-1-dan@danm.net>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506182331.8076-1-dan@danm.net>
References: <20240506182331.8076-1-dan@danm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a1gJzvlb2jdxZFrF5r8DGOtd09gwGmcs
X-Proofpoint-GUID: a1gJzvlb2jdxZFrF5r8DGOtd09gwGmcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1030
 mlxlogscore=563 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2405060137
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

CC'ing regressions list and looping in regzbot (both of which I
accidentally left out in my initial regression report).

#regzbot introduced: 52a6947bf576
