Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632ACF424E
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 15:35:51 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5A810E40E;
	Mon,  5 Jan 2026 14:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Q8wARWtG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6AB1A44C95;
	Mon,  5 Jan 2026 14:27:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767623258;
 b=PZnv/TjN9HTYNFuWgkR/LtdjaMKu+o/ijhHu73a1V2M8Aa2hgEB28LOlNnehWjCwkbuG/
 10G2syAbx20dlMmX3YiGvFgz6MOJVefYQrUTN2z9Wb+OaqWQvbHBotUOatht/5ee9gh5u4y
 EpXV6APqkokCzDRvTN5iZUOV0aiaeXk50TNCUFub4TorLSmmARgONafeCnYsXEERI4XBK6X
 jnurQb+u1ZcLs2s0BN6aQDdi8dLPq1NPOS+iLArZbEpC5OCCBcgNCXxoPm9QEBZZHzfMGHU
 RsMbKPALNH+8Kb4lSKfvaxCZ34pTB9uA2VvpI0ATycNQLWzyzCL5/lZtufJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767623258; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XCOUHvaAPVBQlsZFB5UXzqWiXysSXr09nQwBmvYSu6k=;
 b=dNnr/KDh44gM/n48ATK152Q6O2Rhc+VZP5UoM2pKvptUmDA7m3Q3jgzGNCjs2++Ljj1Ok
 l1TgDcTnT7Dpk3CVqr2uppuA7MfRb0B2ZX0/A5u2QVoUNDXiEPUKdExD4+7Wt9GUMRvemZ9
 ESZNrEDf8C9AXgEiC7i7jjMYnGrDLsmK19qyhAVWjC1aIjLlOVLImJqkh48jo59Z9IwJt8e
 wFyM/rcvNIbNK8pxjluMgdOjx+6CVde9axEvoQ3Yt7VPc3XVweHGQT0bBLj1N/5HfMxEQZ6
 ImRXWaa7fK/n87Ix50zF13DUG6hUeKUoraxNWZ4uxi2txwmaCaGM1vrqnAsg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=joelfernandes.org;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=fail header.d=joelfernandes.org; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2437C446B8
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 00:22:49 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8837C10E0A8
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 00:30:58 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b553412a19bso12795999a12.1
        for <nouveau@lists.freedesktop.org>;
 Sun, 04 Jan 2026 16:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1767573058; x=1768177858;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCOUHvaAPVBQlsZFB5UXzqWiXysSXr09nQwBmvYSu6k=;
        b=Q8wARWtGi6F0FJKKLduVpOgVDI+DE5GpcjDzaE2xitGeeWeuzSEreWxfRLgeepzwKu
         ncBDuneW7E1hB5OPxXZFMgJ5mKJJWH1C64aWRLM//XZGJO0sMT5/8zEtvCzT24eD7aqE
         S9Rf0FobHEVIq2wyu/asgAANMg69JY2uNnpsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767573058; x=1768177858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCOUHvaAPVBQlsZFB5UXzqWiXysSXr09nQwBmvYSu6k=;
        b=TBkKvTLDAF5wBDwE0pEasPQWn9FKbyF20GgoGZ5AAc8Pcri20Y6oVM/iwJXHEKoamu
         SZG0TZCLBUwK2XgCfwM+MgzJ/B99ut7lfPAbGmextGcrh6zOMO8AR49AhvBr+bq/2a85
         9OLrO58Hq59Lev0eKum6lV23yqNMTCFSc79RBMIIAhBgyM7E7GF2hV8JEW6Y+s4kOJMA
         dC9dd3ga+AGre/HYEG4F8ac3xF5lsGV61EBg43Hwt8vsvhPleKI5erhG77Uvr2Xpfqqh
         oOgcigX1znYCdMNsYi+t+4CvJPIAMyU7yujx0ZytSdv3s5tqECp/j4CfHfKuNRT5PRYK
         72CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNTw/LJCr32l+w/VWURCz4hSM56EBSQKzkiMLaOtDHtwsZUKUWxl4YcpKJ2VqridM2n1dozDc2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydvuffHRUuNR38icPrZu+zBv5boopTwfeFppOLPc/he9KlK+vD
	jIiJ48H//cMCz3CuAzAsu8ihxBIPvn1RuQbscC4VLazoVd3FEiijx3hr0bEdKbhmwuc=
X-Gm-Gg: AY/fxX7q7wVbJU+H7ugSSeBg3BuhS5Oc+gUpbRAhKM2TX4bPhG0xNjLjPlagAj/F5vV
	IoMndUVagPgVsc+PWNsQltuwYZcc21SZzANkR4X5phBwtlFCsaM2jv9C7Yq+27qe4oweRPV0yCQ
	M5JB3U9YU5gwnMEPrt8g3GdHgZ1KIxnJi+6zyVF3tufecApR0DcwR8aF1F2JtSxaNDjtNHw09Lk
	h+kp2fSqCpqgfFp3aaDNYchRnrk4v2Xl8h2rb9iIC2yURwbrEKRcGnKymhCQZ48G7WcaRd5G6KW
	mpgRnDG8lExZXrfqi2Zqx4yVfkd5h8vrNtWPsa67Fe18GzA+guStdmTMyQnkyI0OT65wmQLzenD
	PzF3zVP0lkfCHoGRlzp0knODVDsDC/BXuwkzbpv+eNHBhutDh9bislIoVgC6EzFYu42cKSDDt3f
	EjIKUOPktJ
X-Google-Smtp-Source: 
 AGHT+IE9449FQ7FOHazIKXgDJtnuRLaIjG3nv4UMuI5rLRSQ8cHnSvTHqKM2sCHKw//28dbTJ7gQJA==
X-Received: by 2002:a05:7300:fb0f:b0:2b0:5b8f:1c5a with SMTP id
 5a478bee46e88-2b05eca8ba2mr37694992eec.31.1767573057787;
        Sun, 04 Jan 2026 16:30:57 -0800 (PST)
Received: from localhost ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42d9esm9551321eec.11.2026.01.04.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:30:57 -0800 (PST)
From: Joel Fernandes <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
Date: Sun,  4 Jan 2026 19:30:51 -0500
Message-Id: <20260105003051.122076-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joel@joelfernandes.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: OJH3KAJU2FF7VZ5R247UXDRY2RHUCLRI
X-Message-ID-Hash: OJH3KAJU2FF7VZ5R247UXDRY2RHUCLRI
X-Mailman-Approved-At: Mon, 05 Jan 2026 14:27:35 +0000
CC: rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 "nouveau @ lists . freedesktop . org" <nouveau@lists.freedesktop.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OJH3KAJU2FF7VZ5R247UXDRY2RHUCLRI/>
Archived-At: 
 <https://lore.freedesktop.org/20260105003051.122076-1-joel@joelfernandes.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>

Update my email address from joelagnelf@nvidia.com to joel@joelfernandes.org,
which I will be using for community email going forward.

Signed-off-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
---
Boqun, could we take it through the RCU tree for 7.0? Thanks!

 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 84309a39d329..279f8fb223e2 100644
--- a/.mailmap
+++ b/.mailmap
@@ -389,6 +389,7 @@ Jiri Slaby <jirislaby@kernel.org> <xslaby@fi.muni.cz>
 Jisheng Zhang <jszhang@kernel.org> <jszhang@marvell.com>
 Jisheng Zhang <jszhang@kernel.org> <Jisheng.Zhang@synaptics.com>
 Jishnu Prakash <quic_jprakash@quicinc.com> <jprakash@codeaurora.org>
+Joel Fernandes <joel@joelfernandes.org> <joelagnelf@nvidia.com>
 Joel Granados <joel.granados@kernel.org> <j.granados@samsung.com>
 Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
 Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 12f49de7fe03..43bbf12e2c80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14558,7 +14558,7 @@ M:	Luc Maranget <luc.maranget@inria.fr>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 R:	Akira Yokosawa <akiyks@gmail.com>
 R:	Daniel Lustig <dlustig@nvidia.com>
-R:	Joel Fernandes <joelagnelf@nvidia.com>
+R:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arch@vger.kernel.org
 L:	lkmm@lists.linux.dev
@@ -21895,7 +21895,7 @@ READ-COPY UPDATE (RCU)
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 M:	Frederic Weisbecker <frederic@kernel.org> (kernel/rcu/tree_nocb.h)
 M:	Neeraj Upadhyay <neeraj.upadhyay@kernel.org> (kernel/rcu/tasks.h)
-M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Joel Fernandes (NVIDIA) <joel@joelfernandes.org>
 M:	Josh Triplett <josh@joshtriplett.org>
 M:	Boqun Feng <boqun.feng@gmail.com>
 M:	Uladzislau Rezki <urezki@gmail.com>
-- 
2.34.1

