Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2BCE6495
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 10:24:34 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2A17113FEA;
	Mon, 29 Dec 2025 09:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="lEt2ztti";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A372C44C6C;
	Mon, 29 Dec 2025 09:16:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766999797;
 b=H9JzmhJ0rz+AiSlPIaFemJNPEslSx3CiiboCUrVzz97tUsJ+UAtdRhLiG9sDM4xZTDlQY
 LbkebaQJ9pXjPKoX4KZGjoV7Rct9z3hJIpq18PDfM8PI0Pgk2Pff0t8CcKKzylIKwJervf9
 bJ9AvpQiCwBLheAGMSt4r0AaJUDmRxYS/jzo3Ru+K/NUHQDSAmGWpk7SH3lnL4pmds5XlKH
 KZUssn9lglJhxqBaQfWu4bgFqiHBUrzYntrEcA5q8rZx8I3GMQNbpknJEl2VMDP25FIWTON
 oo2GCJnoAYeU3c1lVfrJw9+UmWUJq1NqTl09oIp6G5ZWXH0mGDOKbFoa3Cng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766999797; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r42BM5PvPixDLRp4sXlUhKr0FhxwTxRFCpYTPDnxwMs=;
 b=YOUMSqKhLe2Zqh/s55PqjJfxSAFkIqh5njPMaxRQ0TU+ZT/LvAUEIfd1JXFIAMc4ww56f
 E4eHhukT0Gv/qjFvnNmx5jI3gWXjoL8IfgFuEqrA+eUYSpnSCQ7aD3VJ/HiuYMWTat0CrzW
 pSTj0cp56S2y2wgbyKnXUdDQHJLwrAWd1kW4z1awOgpFyOiv/zcp5p0EjpPRbRNvve0VM6m
 tymf2JGiGds6X7c2+7ZloKLZEUpmuX5EUqmqNaYMbMt90iBnGjcLpNljE2zL+sS39RcKfjK
 Z/HBrH85cUIwZcLLpEFKZSrfAJ0ni2BU+Y9a/6dR2FuzkuUrVyO6zwbgRo8g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ik.me;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ik.me;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3EB1F4040D
	for <nouveau@lists.freedesktop.org>; Sun, 28 Dec 2025 17:38:04 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch
 [83.166.143.168])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36C10E228
	for <nouveau@lists.freedesktop.org>; Sun, 28 Dec 2025 17:45:56 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch
 [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dfRbR40kczVP0;
	Sun, 28 Dec 2025 18:45:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1766943955; bh=r42BM5PvPixDLRp4sXlUhKr0FhxwTxRFCpYTPDnxwMs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=lEt2zttijovlUw1jkQ7vKR1YtKWCTklNXnT8ee4d61fnfV+N/zFfmkaxUHJ/8b/I7
	 FyTrFOAvO9RlYQdWPQdq5o8qkPuLHqF9LF37iT0xGKiqe1IQ3A6fY7KS+C1HBU+J8W
	 0nKC/XipY64kilQrxve+k3KVQ/CKvOFnBzIkrARo=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dfRbQ5TK7z1Bms;
	Sun, 28 Dec 2025 18:45:54 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 18:45:54 +0100
Message-Id: <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251218032955.979623-1-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
X-MailFrom: ewan.chorynski@ik.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 2OLO3QNQWKTI44RALDW2AKFR7XJMFABM
X-Message-ID-Hash: 2OLO3QNQWKTI44RALDW2AKFR7XJMFABM
X-Mailman-Approved-At: Mon, 29 Dec 2025 09:16:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2OLO3QNQWKTI44RALDW2AKFR7XJMFABM/>
Archived-At: <https://lore.freedesktop.org/DFA1CUMND2ME.1D3PAJW641QHM@ik.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello

On Thu Dec 18, 2025 at 4:29 AM CET, Timur Tabi wrote:
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
>
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
>
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.

I was curious to see Nova probe on my laptop equipped with a TU117M
GeForce GTX 1650 Mobile. I compiled with your patchset applied on drm-next
and downloaded the latest linux-firmware.git.

However, NovaCore fails to probe my device with the following logs :

[    3.497672] NovaCore 0000:01:00.0: FbLayout {
                   fb: 0x0..0x100000000,
                   vga_workspace: 0xfff00000..0x100000000,
                   frts: 0xffe00000..0xfff00000,
                   boot: 0xffdff000..0xffe00000,
                   elf: 0xfe2c0000..0xffdf4ea0,
                   wpr2_heap: 0xf7900000..0xfe200000,
                   wpr2: 0xf7800000..0xfff00000,
                   heap: 0xf7700000..0xf7800000,
                   vf_partition_count: 0x0,
               }
[    3.623000] NovaCore 0000:01:00.0: GSP MBOX0: 0xffffe000, MBOX1: 0x0
[    3.623026] NovaCore 0000:01:00.0: Using SEC2 to load and run the booter=
_load firmware...
[    3.626236] NovaCore 0000:01:00.0: SEC2 MBOX0: 0x31, MBOX10x0
[    3.626265] NovaCore 0000:01:00.0: Booter-load failed with error 0x31

Is this expected to happen ? Here is the full device description from
lspci :

01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1=
650 Mobile / Max-Q] (rev a1)
