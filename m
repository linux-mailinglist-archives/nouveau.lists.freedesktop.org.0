Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3CD1E58E
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 12:18:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3F0C10E5FC;
	Wed, 14 Jan 2026 11:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mjZavTHi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 103B944C4D;
	Wed, 14 Jan 2026 11:09:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768388968;
 b=mf60fzG0oxuow4drUPoSTWlzaZOUrqyZUgMCUhSs2EPoYIbQUt8QllwmYWPTO6fu88UWw
 MdXMX2zG2arp74YQFbFe+fGOxcz+GY1whs4WvG7QPUqW4fRuo4Tes8BAX1n7sHIgNWNM1U9
 hdQu5ugEFWr+mJ9+G9qeB3EU03QYcG8A67bW9CIwbksjz38FA7p7uArYcMNYRPR26NZeut+
 GIrQgQ/wv9ORJE5DOLgn1USx/SwIpwq3DtBRqi70cPwCHRElyOI5NhqOJmjg61cBxOpgSV7
 Maqq9D7fSkBhV95//fibMnCIpZtVy/LnAQqK7986Usaz18kwfz/+kJP0R++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768388968; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VBlpZhj/LWoZA1q8Bmj+GGOWyxlXRKjMjJARHdb6ULc=;
 b=vddIaE9IPVZKySqJuXiyjML/odantQNHunWKpMsxKmsW8oI///u/vbF1PpaM3kkb2OC8T
 9TJ2HVQKRmVRtDdBjACk2HrhcGbkdJkVVXkCHRDEgJbZdYVhZ2jodAewznZLvH6kNmTUhI8
 ca3MRXjBLmHKWCiwexYaglDqpP9pPl8SrZPaz01RdGYeCwmsLVdnJPUZ+H0pmZKeriK+Qfl
 Mpa157D6sp4urMsCO/F/gvTcmsaIa39jOXUNKaWHovoPOkSfnpOTF93AzpA/wh7mg/T8fnn
 RRWVVcNoNT3xvbyl2Bq5VnsXEDbgdcEl3sNMBrB8JGUVhYPPEz5wMvCURlOg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C9447400E0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 11:09:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 719FF10E5F6
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 11:17:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3366443AE9;
	Wed, 14 Jan 2026 11:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B198C4CEF7;
	Wed, 14 Jan 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768389476;
	bh=VBlpZhj/LWoZA1q8Bmj+GGOWyxlXRKjMjJARHdb6ULc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=mjZavTHiAAR74GbiRJqzGs8PdvqPNC4LcFbEla7pigFlDJGs1YMSR2EDZhPpSEBB/
	 Q3+dMqmeHVOhd9jg19LQcejKEUDkOCDpn3IabgJsz8HJZN2HNU+NeheLKaG8A8NoSr
	 boV1PM3ur9gKgyoeLEClwIo466ySMVclLL/mOqfElG9AQbMgY3rpG2KMUT3Y0rG/Yr
	 nFnDvNr2X8Cx6zpzZ1iOCtz9SKXX1yKfyht2FbPzU2xYdTekjf4OrMAkxPQG+WdbRX
	 Uft8XqDFtBoTVmLLmSo8XzTb8U8FuUDwACUWvNdWJLP1BoOvd/EqkAypIpuWLlL9iR
	 7loObO3VrNyEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 12:17:52 +0100
Message-Id: <DFO9R0JYCKZW.1P47POES0Z1A@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
References: <20260113225408.671252-1-ttabi@nvidia.com>
 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
 <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
 <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
In-Reply-To: <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
Message-ID-Hash: N4EWMILI7SBZKJR3LI6YAPN3HA5Q7WBP
X-Message-ID-Hash: N4EWMILI7SBZKJR3LI6YAPN3HA5Q7WBP
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N4EWMILI7SBZKJR3LI6YAPN3HA5Q7WBP/>
Archived-At: 
 <https://lore.freedesktop.org/DFO9R0JYCKZW.1P47POES0Z1A@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 12:59 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-14 at 00:50 +0100, Danilo Krummrich wrote:
>> Maybe Gary has an alternative idea for a temporary workaround since he's=
 working
>> on the proper solution to safely access module fields.
>>=20
>> But again, I think a simple global with a FIXME comment should be fine.
>
> That's what I had in my initial version.
>
> I wish you had said something when Joel suggested it:
> https://lore.freedesktop.org/nouveau/246c1ad4bb1ca7ef34f331fba33989bbae86=
18f8.camel@nvidia.com/T/#m69a23a3db642c8cbb22efe0e24647811e8ae3f12

This was when I came back from being five weeks out, left with > 10k unread
mails. This was known and I even offered a separate communication channel t=
o
reach out should something come up that requires my attention.

However, only two days later I did catch your subsequent series, replied [1=
] and
mentioned everything I mentioned in this thread as well.

> I spent a lot of time over the past few weeks implementing lookup support=
, and now you're saying it
> was for nothing.

I understand that this is frustrating, but I wouldn't say it was for nothin=
g.

You previously mentioned that you are relatively new to Rust; glancing at t=
he
code I can imaginge that you learned a lot from working on this, which I th=
ink
is pretty valuable as well.

Also, we can pick up this code at any time should someone find a valid use-=
case
for this feature.

- Danilo

[1] https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/
