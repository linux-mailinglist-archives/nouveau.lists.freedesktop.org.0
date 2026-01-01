Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E3CEEF54
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 17:20:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBF3B10E29F;
	Fri,  2 Jan 2026 16:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tJcLEqXv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tJcLEqXv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 51F7744C81;
	Fri,  2 Jan 2026 16:12:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767370340;
 b=VPejrxA56kuTi4Cu3avopue4ghn7qW53q3USugJR9fwDIdL0WA7ND8R/pBQobB35tUsUB
 p/1HANwljpfFbKGJxtRsPPG4bT+EwPNVlP1JmSgKyoblmpJ+ggXLQc40RyxVWGspcEWquYN
 yWZTW20DIX6vTvf4xtTux510CmRjH+svDUp/NcDRcW1RKkJUeuAnQV2nEmP6Ht0DBeWUd9b
 F/09ugNb3+XevTBKQj+mqwTW5e9XyxC3yUWuuNt0XSrbbp6mTRcA1aqJ9gfq92ZpSAx98L3
 oR8d1a1OmyS3UoiNcYkQGV+qNHJh/1lHv1y/c+dclcu6XjEp8MogHo6o6E4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767370340; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0KsDstpxPfEmoJFxxat6nI8hzti13oPVPYmI3WSj8wg=;
 b=Tp/ggKBwXvGLJ4mrS2EJ4a+vH5wAqDHxJ6qpYCJ4NwjK56C/RKcDFMnvM/2GcZNQe315P
 ER8HoR265ZvQBtYtpF2xFVTqzztJYb3nZf1lqRsOCM6cPOMT7NATGE892BJLmmNDXT1EkFQ
 c0RjqLub7RaNER+kK7nDy/p73SEwYRhDXzyHxGWS+H2PA6PYdc8wSikofx1tk2OAesk4uE/
 1DQO4Leq5C809xpf7f/drrERnYH37PLVFc61GD1/TNf6uHfJYMSV6pFuMbnomK2liEpRka7
 KvW3AAQjri81B5DjyiWimZkWKYcgIr8UYOb0EwkzsP0rQ4Mlf6oDgEhBvdrw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A2DB44BA5
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 18:40:42 +0000 (UTC)
X-Greylist: delayed 419 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jan 2026 18:48:43 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E45D710E058;
	Thu,  1 Jan 2026 18:48:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhwdz1pjqz9srM;
	Thu,  1 Jan 2026 19:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767292903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0KsDstpxPfEmoJFxxat6nI8hzti13oPVPYmI3WSj8wg=;
	b=tJcLEqXvymLZHN815RIrk2fYTlMW3jISiUz7afjzHgptbU78t1/YvU/1dsj7Sj5w+ZhYNZ
	vNC1TUdXsU01VdtZddiRwKVQMNlB85lTJv8CJEj5rUoXBbwBHFy9kxPx2PbOLKPllqXZ6l
	Pc+9/qUofD1G2tdjGF75u2Ycb1pl0jx1MqgOncBz6r0lVgrrkpu3LoclG5DRwy5CiuuXP/
	+6quJBThUABiBy4hV7Ti+Y7e0+J78gAWq8e8ZTiFdDdVv7ebcsZq3AeSBWTGwc96DlUIMX
	hSB1nz5sjmt4VC0UKwjF9sgpHbbMgl8dd9nfW03xseICEzctp/QbBIU6gZ5Wjw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767292903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0KsDstpxPfEmoJFxxat6nI8hzti13oPVPYmI3WSj8wg=;
	b=tJcLEqXvymLZHN815RIrk2fYTlMW3jISiUz7afjzHgptbU78t1/YvU/1dsj7Sj5w+ZhYNZ
	vNC1TUdXsU01VdtZddiRwKVQMNlB85lTJv8CJEj5rUoXBbwBHFy9kxPx2PbOLKPllqXZ6l
	Pc+9/qUofD1G2tdjGF75u2Ycb1pl0jx1MqgOncBz6r0lVgrrkpu3LoclG5DRwy5CiuuXP/
	+6quJBThUABiBy4hV7Ti+Y7e0+J78gAWq8e8ZTiFdDdVv7ebcsZq3AeSBWTGwc96DlUIMX
	hSB1nz5sjmt4VC0UKwjF9sgpHbbMgl8dd9nfW03xseICEzctp/QbBIU6gZ5Wjw==
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] gpu: nova-core: use stable name() method in Chipset Display
 impl
Date: Thu,  1 Jan 2026 19:41:36 +0100
Message-ID: <20260101184137.80445-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c12ee0ab6ccfe1fcacb
X-MBO-RS-META: 4myaz3cqa73rzs77hg741bizctpyjbpu
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 4NZLDRQOMA7VVX7GNQ7FXXYTMJAQOWSZ
X-Message-ID-Hash: 4NZLDRQOMA7VVX7GNQ7FXXYTMJAQOWSZ
X-Mailman-Approved-At: Fri, 02 Jan 2026 16:12:17 +0000
CC: Maurice Hieronymus <mhi@mailbox.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4NZLDRQOMA7VVX7GNQ7FXXYTMJAQOWSZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260101184137.80445-1-mhi@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Chipset's Display was using Debug formatting ("{self:?}"), which is not
guaranteed to be stable. Use the existing name() method instead, which
provides stable lowercase strings suitable for firmware path generation.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/gpu/nova-core/gpu.rs | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..be8c882338ea 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -107,17 +107,9 @@ pub(crate) fn arch(&self) -> Architecture {
     }
 }
 
-// TODO
-//
-// The resulting strings are used to generate firmware paths, hence the
-// generated strings have to be stable.
-//
-// Hence, replace with something like strum_macros derive(Display).
-//
-// For now, redirect to fmt::Debug for convenience.
 impl fmt::Display for Chipset {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{self:?}")
+        write!(f, "{}", self.name())
     }
 }
 

base-commit: b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
-- 
2.51.2

