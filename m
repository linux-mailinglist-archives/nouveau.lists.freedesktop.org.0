Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A3D1BC0D
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 00:50:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE0710E568;
	Tue, 13 Jan 2026 23:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="caFish3e";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4D28F44CAB;
	Tue, 13 Jan 2026 23:41:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768347707;
 b=R3RVANx07D/q/s6mk/46B9L8r0Nt6dUK9JSdDDnbT8cdQU8ePvfQprL1U7BhDdlOhATkR
 EaNqZaPa4tUSrDe077uCaowPkmH+AVgoLQs+Nfg66WpiKkGdn+FST0Bltb8IDSwaqlBrjVV
 XY5Fwxg5sLNdQTziu4beK7f9+D/MifzHZF8tTjx06S8wPZEl2dIs/OHzil4Ov9DRq8vL+tm
 G7bDL9rv7igol/lDRvZoS1+kNKunx4JHRGCL4A/clxYy4rH9atRHmxNfyfbbV0te8Tw+N9D
 niGYv61ivhJQpDHP7Na6yhQKfIPc0PyUZbaIFJuBcXDz0ye78ml+Lczsl7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768347707; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cxOn98AdLrDvw8o5arFqqbGQmuaW7d8LO8eGH6FiMnU=;
 b=csvy6hvMxB+1HyxxHKI2CU8hjAp2Kp+IW3QaSpVnt27siclbDM3ngQZ5BTVTgx39lJI93
 xmBRJ6kxNA7EWHEXL289jVLgttWRg7vkUdZn6X8D3ZOZVuIMJ6n6Dn4bG5Hsd5Ok13TosDc
 OumSECYLjK5F0pFenyq3qpLqQFE8h95ZcMWZkzVlgyNs8wa0E9152zf/lmvDa5vGyFL9LrO
 PfTNEEa6M8UKNQMFPvskKoe46KhJawujXGMVUt+xuL/LxRn7CoGU0RHFMfYRMtg1CtNX+FA
 mQ/Y+YLYeFCsLbqEMgy2Dw2PgKqZCh5/Hat6X7ziBCgELwYQCJoByVk9OMNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E3EFB44C56
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:41:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D85910E197
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48E5C41926;
	Tue, 13 Jan 2026 23:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F522C116C6;
	Tue, 13 Jan 2026 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768348214;
	bh=4gH3OqHXRiujVd2frhAWXe/v7iYskHdc8QUneL23n78=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=caFish3etcpnX40jZaz3fgWsy6eMWdcxOj0arF9HQFYaPTS855UJ6YuK7mYLhDR6W
	 /Oxnk/rqEwcqwC9GyUKtMjcgZ/ciM/gHN5+5uEXQJ+ByYhQ4givELqrQS0hp09od85
	 7hEGgShN83FvjOnZ7v9ykSxBAEtmCufLIN+OSGgjclsLiotlheVYgEq7Sc+7sr7wVD
	 I5OgBwzeDEC5AMqi0yitbGD0ZrBz62SDBFBlx0iLs/Qik7g4VmUWHzImgMAn0O/Oo+
	 kfvIkuMd+t3m6T/OE9O7gKWPMGUCoQjRd/7YVGk734dg6/0XUBIzYZIeelzWAKDIGP
	 B92JdSZRwmjFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 00:50:10 +0100
Message-Id: <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260113225408.671252-1-ttabi@nvidia.com>
 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
In-Reply-To: <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
Message-ID-Hash: YLVNLXRYJMBZHBOY7A47W2UV76H5QDTH
X-Message-ID-Hash: YLVNLXRYJMBZHBOY7A47W2UV76H5QDTH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YLVNLXRYJMBZHBOY7A47W2UV76H5QDTH/>
Archived-At: 
 <https://lore.freedesktop.org/DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 12:26 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-14 at 00:11 +0100, Danilo Krummrich wrote:
>> On Tue Jan 13, 2026 at 11:53 PM CET, Timur Tabi wrote:
> Sorry, I couldn't find these messages in my inbox.  I will address them i=
n v5.

Sounds good, thanks.

>> > =C2=A0 gpu: nova-core: use pin projection in method boot()
>> > =C2=A0 rust: debugfs: implement Directory trait for Dir
>> > =C2=A0 rust: debugfs: wrap Entry in an enum to prep for LookupDir
>> > =C2=A0 rust: debugfs: add LookupDir
>>=20
>> https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/
>>=20
>> Especially this one is a concern, I don't want to add this infrastructur=
e as a
>> workaround until we land the feature Gary works on.
>>=20
>> As mentioned in this reply, I think that debugfs_lookup() rarely is the =
correct
>> solution and more often indicates some kind of (design) issue, like it d=
oes in
>> this case.
>
> Well, I'm at a loss how to proceed, then. =C2=A0I had a global variable, =
which is the approach that
> Nouveau uses, it was recommended instead that I use debugfs_lookup().  So=
 I implemented that, but
> that is also rejected.

Yeah, the global is not a good approach for a final solution. But as tempor=
ary
workaround it's probably fine.

Maybe Gary has an alternative idea for a temporary workaround since he's wo=
rking
on the proper solution to safely access module fields.

But again, I think a simple global with a FIXME comment should be fine.

> Danilo, you are the one who has been pushing for this code.  Please note =
that the logging buffers
> can only be parsed by Nvidia employees anyway, and we can just use this p=
atchset in house to debug
> GSP-RM as needed.  So if you want to wait until Gary's work is ready (I d=
on't know anything about
> what he's doing), please let me know now and I will just keep these patch=
es internally.

I can't remember pushing for it, but I do think it would be good to land.
