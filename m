Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E4D3AF09
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 16:31:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5266910E49C;
	Mon, 19 Jan 2026 15:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4XhWmby";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F247A44C6E;
	Mon, 19 Jan 2026 15:22:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768836176;
 b=j/t40inyWwtMvmrUIlNTxD2KPgoRGZ14isnKQzIlKyLgEyuKbipd3WlNdr/UjODxQaO6c
 ZMRXmhf4eJFWzVwLEgahq0Zigloylad38DkMSTO2WlbyCQazJmFe76C917JXpBlqzh7BpYD
 wR7e2mFh5g5BqDfzwdpewQBqA5cNddBw5uA4t2hDMk4CGIS2soQ1zh4sls6SW2sg8KMYXCo
 ECTQ3XGOpk6RrwB5bEe51qhR0iD6VYgWmvQZVyDOIhhmImaVcuJwdL5M6MVrSy9gkA8Lbx2
 Ows4kMpI2h+rVIhFWj+i23QUjyvPNuVPe+IiuJXhpaiC+ZoQxvoVj0onVsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768836176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sTl+8TMNc8tAUyoJqt36PBwfSXOIGj2CYK3EXAqdLls=;
 b=JK9wE9X2UWKtJyPd23zFMbDFXPXp+UzrT41gwx00njBDXY4rkGDBaMse3gN3vhFgHmTzZ
 z+4NmCzooQZDHEPGUiOc6mPYAjXNyhsLcccaVC1GvCdv/RAkACLYuD+uciaxuiio+rGmkZa
 tLg77VMtPf9Fyjg43fL8DJ96OTELneYGtEbzPErvF+0vfbu5wismdhixhdsUSX5jIBXVpUM
 BUJZZAY7jyDoL2WKhYVbBt2pwrriLAKgqFhT/Xq6JXphx1PTp/QFMYEtnmj4XAAIyG//0BJ
 sLnk0OP9CQPE7OzT8aRwevLPZJUcRIpeIG8K3Rw6FCiBeTXrdpdfAUAgcBQQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 810C744BB3
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 15:22:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A37C810E19B;
	Mon, 19 Jan 2026 15:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21B5E60055;
	Mon, 19 Jan 2026 15:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F74C19423;
	Mon, 19 Jan 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836695;
	bh=Rutg44yRMmYuxi30Cfs/bJk2QNaEIsjLQT0fhQq38kA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4XhWmby85H+lO40VgKGtSK24/QHQ6E5L84nZE8Pd9j6jlq7qb3SzZ6ZjMzbVZ5Gn
	 xKUtz46DZEZXGaMMiMat+XTN9GSs5SLnBl/fJgTGTj5ruG2n37i/ZqraXzrGi2OgMY
	 N6p9VhX5v7/uIG0phchviPvni4XSBh/6meWakfO8zN8By/cfL+nLCcakee3XqJyuy7
	 fHA3vR7E5gDBhSW8CMNR5cuQ48KlOvjgkN1Jl7F9ijVnn+gMmEdR7JvH3fspNNZygK
	 gOIcVotUxqMq1me14RZE/wsXs35Ug5Gof+230udkb/BdDORD64IPZ/kdTOLUbrUHUc
	 VthUxFSvoT0RA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Subject: [PATCH 2/2] Documentation: nova: update pending tasks
Date: Mon, 19 Jan 2026 16:31:05 +0100
Message-ID: <20260119153129.59876-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119153129.59876-1-dakr@kernel.org>
References: <20260119153129.59876-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EUDNY7WOGHEAOB4YARKHS2MBD5LULFRS
X-Message-ID-Hash: EUDNY7WOGHEAOB4YARKHS2MBD5LULFRS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EUDNY7WOGHEAOB4YARKHS2MBD5LULFRS/>
Archived-At: 
 <https://lore.freedesktop.org/20260119153129.59876-2-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some tasks, while already having some progress, are still pending, hence
update them.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 2d920ee76ab0..a3ba3e189049 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -41,8 +41,15 @@ trait [1] from the num crate.
 Having this generalization also helps with implementing a generic macro that
 automatically generates the corresponding mappings between a value and a number.
 
+FromPrimitive support has been worked on in the past, but hasn't been followed
+since then [1].
+
+There also have been considerations of ToPrimitive [2].
+
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
+| Link: https://lore.kernel.org/all/cover.1750689857.git.y.j3ms.n@gmail.com/ [1]
+| Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Implement.20.60FromPrimitive.60.20trait.20.2B.20derive.20macro.20for.20nova-core/with/541971854 [2]
 
 Generic register abstraction [REGA]
 -----------------------------------
@@ -152,7 +159,11 @@ PCI MISC APIs
 Extend the existing PCI device / driver abstractions by SR-IOV, config space,
 capability, MSI API abstractions.
 
+SR-IOV [1] and PCI configuration space [2] work is in progress.
+
 | Complexity: Beginner
+| Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com/ [1]
+| Link: https://lore.kernel.org/all/20260115212657.399231-5-zhiw@nvidia.com/ [2]
 
 GPU (general)
 =============
@@ -191,7 +202,10 @@ Some possible options:
     - maple_tree
   - native Rust collections
 
+There is work in progress for using drm_buddy [1].
+
 | Complexity: Advanced
+| Link: https://lore.kernel.org/all/20251219203805.1246586-4-joelagnelf@nvidia.com/ [1]
 
 Instance Memory
 ---------------
-- 
2.52.0

