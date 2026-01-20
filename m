Return-Path: <nouveau-bounces@lists.freedesktop.org>
Delivered-To: lists+nouveau@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGKkDfKfb2kbKAAAu9opvQ
	(envelope-from <nouveau-bounces@lists.freedesktop.org>)
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 16:32:02 +0100
X-Original-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABE4618B
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 16:32:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19FA610E61F;
	Tue, 20 Jan 2026 15:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXL/2e/8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 778D144CBA;
	Tue, 20 Jan 2026 15:12:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768921939;
 b=KRnWC6DIUE/q3S5qnK47wCfM5xcX0X5/0yaGdBs4NnRC2t5k6qCZResarqLiNb6Xow/20
 2zFsQz8zZo9oF5eoC+/bpnBQXpBNbxUU7ANFGNuGPFlNxVmEgS8H5nHYRmpTSjESMmBAOai
 BdG+LmmYjO9GrWTxtx5hycETF7PXftjneVUyxWQgnxvkWt2gagAZGY/ZWLD3g6orrKceiaz
 nAMMmH97AOYntQ+pwMRol9NM2F2/gSgeN2dgArhmbQHGIx3Fxz/8vIKnEYXj1GxzYYCrkbT
 dVin8G8RA7OC94mfuhOK1kvqa4NCR4+PL4LKec0fzCIoAEB1k92tPBfFTD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768921939; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wRP1g+l1TCQKh1iW+QbsgHeOKR+PqDADWkFFgCoGF18=;
 b=CJ5Ar3BUNmikhKq006kVPk0BaThtZexXLwzFffoks6AEQSunem7u4jrAklibGqSVkAlsu
 lh8Ax0QziMmY/otS8qxy4LGzP3BEhLDTmWOhenMhOr3Ba8gbjvFJ5vL/Jt5EVPbw5g4pCWO
 YifWclp3Rp438mjH4cY/u3ML2I3OVRdejOTKEPmH84kIM2qLI4/E5qrKPX6O37c1+JgIWLN
 m8Sirz56EvYw3BP2SiaHPfjUNtWK8hlAohpgR1liVOQ7cpAyM9RRHCeYN35ZP6VfNeBwxUH
 MC4nkaC8r/N5byS3jcW6IKrn/N2Ys03WlniqWbFQ1xv37nemNH9ZL8c1U8Aw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5656944BDC
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 15:12:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A83A610E180;
	Tue, 20 Jan 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922460; x=1800458460;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rly6cCw+0ig+tDNja4gVnOtmNvKTz1Q7pv11bHQAkZ0=;
  b=WXL/2e/8CWTdHItkk8jgoHDvfcjSfwgeMgq0dVOHF4ITreLT9MN6g391
   feV6LL5bAvKh54HcGCueBNZDvot4f8H8Utj6wbpsN1rWT6ItOuaEfWGJr
   Q7BFouP/WxkS7cRcaSZfr+cO2BAa4cDlH4e2ztPNiKAqdsxhbX9+FQ8o3
   pnFeg5frUWoMTVk0bkehYkITQiTXddvcGWgoj6mFljQIZfvdl6RYikVq5
   xhdtA139UH50K3QXo0xNSKKWRv8O0R9XKIs5ycS7yd90lTlGav22Nn10D
   qy9Kvm/CB5s/tbusnCuhmrG0E5HoKg2ZgBQzxvVqmyDlF/ndYcNhPFSNh
   w==;
X-CSE-ConnectionGUID: XzfFvjc1RDq0ca7X19cEwA==
X-CSE-MsgGUID: golm/qI4QwK+VWqahrea5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70225899"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800";
   d="scan'208";a="70225899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 07:21:00 -0800
X-CSE-ConnectionGUID: RiswWX6rQAednUhnLUet7g==
X-CSE-MsgGUID: taWkR410Qtac8KDCqrgyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800";
   d="scan'208";a="236826238"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 07:20:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 502FB98; Tue, 20 Jan 2026 16:20:56 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dave Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
Date: Tue, 20 Jan 2026 16:20:49 +0100
Message-ID: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E2MQDKW3TMPM7KESYVJ5Z7YRSAQYODE6
X-Message-ID-Hash: E2MQDKW3TMPM7KESYVJ5Z7YRSAQYODE6
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E2MQDKW3TMPM7KESYVJ5Z7YRSAQYODE6/>
Archived-At: 
 <https://lore.freedesktop.org/20260120152049.1763055-1-andriy.shevchenko@linux.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>
X-Rspamd-Queue-Id: 84ABE4618B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.freedesktop.org:s=20240201:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:dri-devel@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:andriy.shevchenko@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,nouveau-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,nouveau-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[131.252.210.177:from];
	PREVIOUSLY_DELIVERED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nouveau];
	DNSWL_BLOCKED(0.00)[131.252.210.177:received,131.252.210.177:from,192.198.163.15:received,131.252.210.166:received,10.64.159.142:received,10.91.253.5:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:received,192.198.163.15:received,10.64.159.142:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Now we have a helper so there's no need to open-code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2a7e80c6d70f..c675324693af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -796,7 +796,8 @@ r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 	struct acpi_object_list input = { 1, &mux_arg };
 	acpi_handle iter = NULL, handle_mux = NULL;
 	acpi_status status;
-	unsigned long long value;
+	u64 value;
+	int ret;
 
 	mode->status = 0xffff;
 	part->status = 0xffff;
@@ -806,8 +807,8 @@ r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 		if (ACPI_FAILURE(status) || !iter)
 			return;
 
-		status = acpi_evaluate_integer(iter, "_ADR", NULL, &value);
-		if (ACPI_FAILURE(status) || value != id)
+		ret = acpi_get_local_u64_address(iter, &value);
+		if (ret || value != id)
 			continue;
 
 		handle_mux = iter;
-- 
2.50.1

