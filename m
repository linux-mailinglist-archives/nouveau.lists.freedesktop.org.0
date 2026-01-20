Return-Path: <nouveau-bounces@lists.freedesktop.org>
Delivered-To: lists+nouveau@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AdaCCPHb2myMQAAu9opvQ
	(envelope-from <nouveau-bounces@lists.freedesktop.org>)
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 19:19:15 +0100
X-Original-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880CA49524
	for <lists+nouveau@lfdr.de>; Tue, 20 Jan 2026 19:19:14 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC9910E648;
	Tue, 20 Jan 2026 18:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rMovZpB8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7856944CC4;
	Tue, 20 Jan 2026 18:10:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768932628;
 b=iS1qz477kB6yR0hyfh+fP0Fq6OXrpPnGc63HEtiaLs8IVancIrXoTEjy24jmqheLSyuYj
 ReJsGVoM/+5B86uMBf8NukFcG48eEgdNsRVOMo+8IpCkSBA0Ibt//2UfHuaPAxg+s0QUj30
 Hl/LyyzsRH38LcbLj8kM4J4w43XtScGlXh/AlsyUCarfyx8HAVdupIXyPltaMO2DmkjHQOX
 L6WVBTp8HL/ZYjL5gKfuZPD9dT+N7PzH/s2Axww0MZzvIZRa/H1gnARfPxSzQLjwlukFQ1C
 ls70F6BFHL9RuPZt2/4aTPp66BA7ZgZC74r6f7alLaD8jDEPdMUVRcWDUM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768932628; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DZHCHrPai1BOZjzmTZ9umyt/NN5XiM6GOrFB1Vta06U=;
 b=ZNcHtW+dQ5OXScGJcaM9dk3X2oCECbdl029t9drRvAq9ADwAIg6GQAHRSKtNkD5ZxMx1b
 No/0lI3yo9ATy0Jvi3UdLeXxVwRXpke8fzoZvTEE8wi82SERniVQR5kS8PqZQLhYWYPCSO0
 zjxisnWx25f2LtTILjeTg0Axx7z9AQdR2KhpnQjsJaB0rWpEWvrbXnBJW6QbDfEGS5q2O8P
 sY4PUr2YyqvrFCTuzH3GH3xyQHLr+kQe2sGaRo4LmUZjQH+f1zrhPqCd+UrfCPtdeKCxt8A
 p8M7T9RDdWYVdonc/MrrNYbANpHwKrX4XFq0BEfYz8C9BJWa4zO1K5YutbOA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C746344CA9
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 18:10:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD7710E208
	for <nouveau@lists.freedesktop.org>; Tue, 20 Jan 2026 18:19:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF29F60010;
	Tue, 20 Jan 2026 18:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EB6C16AAE;
	Tue, 20 Jan 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933149;
	bh=DZHCHrPai1BOZjzmTZ9umyt/NN5XiM6GOrFB1Vta06U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rMovZpB8F5ReSdV8dzwdJlwVP3Bz/Wfssa0fCWrr2uhx+5Dafo19U8MrJxk4lDk9/
	 apCvKGHAtRu0qdGfdDH1lrT9pVTIPHVp5XWC/fArUa79TXzV0dduXXF7BDsrwRcJ/f
	 pD44ag4ozatad3RA8uWXcdMuC1n6i0LOvGlbOb59sImEDMHBCsYcazG/23OLPTH35h
	 s9Fh4eIXg/lFP4Cu85jadqgmqmDfCFD/AJLWyWUk/YD7etdiCeScBmd+nsCmqlgonT
	 8LoVzLnq5RNCaG5Lo3oWw6dMjD8mThmDpCL6qfVhsW+C/jn2N35L8bgZTcYGHEajeX
	 Ea/4F8BmwU4JA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 19:19:06 +0100
Message-Id: <DFTMGSPH6EGO.3NVQ4DRVVCDDF@kernel.org>
Subject: Re: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-3-ttabi@nvidia.com>
 <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>
In-Reply-To: 
 <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>
Message-ID-Hash: 2GV2BGISNCZLECABFT4VOGU7WCYNZ6RJ
X-Message-ID-Hash: 2GV2BGISNCZLECABFT4VOGU7WCYNZ6RJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2GV2BGISNCZLECABFT4VOGU7WCYNZ6RJ/>
Archived-At: 
 <https://lore.freedesktop.org/DFTMGSPH6EGO.3NVQ4DRVVCDDF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>
X-Spamd-Result: default: False [1.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	ARC_ALLOW(-1.00)[lists.freedesktop.org:s=20240201:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,nouveau-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mmaurer@google.com,m:gary@garyguo.net,m:joelagnelf@nvidia.com,m:acourbot@nvidia.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,nouveau-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[nouveau@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nouveau];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 880CA49524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 6:54 PM CET, Matthew Maurer wrote:
> I thought the whole point of Greg's admonition to never report errors
> and to automatically create no-op structures if debugfs was disable
> was that we *don't* do things like this, and instead you just do
> something like
>
> ```
> // Always do this, whether or not debugfs is available.
> let debugfs_root =3D Dir::new("my_thing");
> debugfs_root.scope(data, name, |d, s| { ... })
> ```
>
> If DebugFS is not available, it already returns an empty fake
> directory. That variant of a fake directory is also size 0, so you
> aren't paying anything to use it...

Correct, I also explained that in [1]. This method may be useful if the dri=
ver
conditionally wants to provide debugfs entries regardless of CONFIG_DEBUG_F=
S
though.

Of course, we should only introduce it if we have a user for it.

[1] https://lore.kernel.org/all/DFR7AHOX0T8G.2NB9VOS3IZRZE@kernel.org/
