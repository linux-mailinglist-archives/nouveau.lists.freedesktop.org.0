Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9694482916
	for <lists+nouveau@lfdr.de>; Sun,  2 Jan 2022 05:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42A89F77;
	Sun,  2 Jan 2022 04:17:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mr85p00im-zteg06021901.me.com (mr85p00im-zteg06021901.me.com
 [17.58.23.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200F6113F41
 for <nouveau@lists.freedesktop.org>; Mon, 20 Dec 2021 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1640027842; bh=oEd1/Nx3AqNocMtu+/yy25+4PG7xkt60w3PEpzRII28=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=vaeMilyVJ/FP2kc07lAXBkfnn/q2rc57jz9YA75cQcKfXd7c79AFbbY3h0x7AEnhX
 qCETE5+ah06gCcPhNg0MlXtms4cSSSeo/8UQ+RbqJ+5xqw7kdCIyQ/mw5WefU+EguJ
 rzUEqk20NcZi4OJRTNlNcNoVpjR1KUVSNQ2ZAHAQjz5fOKKvWDcoWL4VzUMwxx2u1j
 y9YbsLmA2t9AUXjnSQaAkx/jfw+tXZwCLGCOY8yaawDT1X5XvemXH8CmEani9Bw+n2
 1ncOWPjdtl+JWww0MUOpmrHZ/DJhbwCUK2m8rFLNjZYzYyYDRRzJkxEze7zVVHEJhH
 mf/NpcJp4ENHA==
Received: from hitch.danm.net (c-73-98-236-45.hsd1.ut.comcast.net
 [73.98.236.45])
 by mr85p00im-zteg06021901.me.com (Postfix) with ESMTPSA id 01C98720C72;
 Mon, 20 Dec 2021 19:17:21 +0000 (UTC)
From: Dan Moulding <dmoulding@me.com>
To: ckoenig.leichtzumerken@gmail.com
Date: Mon, 20 Dec 2021 12:17:02 -0700
Message-Id: <20211220191702.27995-1-dmoulding@me.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211209102335.18321-1-christian.koenig@amd.com>
References: <20211209102335.18321-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-12-20=5F08:2021-12-20=5F01,2021-12-20=5F08,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=567 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2112200108
X-Mailman-Approved-At: Sun, 02 Jan 2022 04:17:56 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: wait for the exclusive fence
 after the shared ones v2
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
Cc: nouveau@lists.freedesktop.org, dmoulding@me.com, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Tested-by: Dan Moulding <dmoulding@me.com>

Thanks!

-- Dan
