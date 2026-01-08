Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E2D03107
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 14:36:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12E0410E727;
	Thu,  8 Jan 2026 13:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mm2pmZQW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4A66844C69;
	Thu,  8 Jan 2026 13:28:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767878891;
 b=b+CaNPcy92W4Ece9rS7KAZWFM3KXx25+bNQgNLZ1N9fHBSbIRmvJ4EjZrquYhOB9rvzOJ
 xIfEApSoHC2KFJlQeQvYsiFKjpujST0fUOYZV72QszJgZrbZRT6e8z8B2YEyS/g3qki67IQ
 heApCCT9KVZB2sPiqu9b/j+apKlOtfzKBn/PRiojv0L5LHBsp9f24uz/taVEQwhdiViF3CP
 59cUdL+4hzSbsqw26DVlSU+HaKIgs7UKaDEEITMsUpqxN8ts8HN15pM0WoUCdEHdBcpee+Y
 +oM/xLJI6Eck2e/4tKSyIyS77LvCdgpDSodV6RnwubQTl2Rs/oPwdy2oF1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767878891; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=F8QXJAT0ZzwxRxGlCXvofXVF9N0tIi1UxMh82KD0L3g=;
 b=xeyo5SvKLSXx6fNflQX1wxWffCg+C1Qlu1Dc6pWQH8XbS+RuA9ibGM9dFShQ0jGT/nk8u
 e4/3VT6my/mPpek2qA7NUcB7ASPoDyg8HMuLOEMGORAoDc5AbePjCwLL1Zrh7zxroEltY0G
 gAlAiza/wD+RnAMbfzTHv0bMjygFdQF+60rynB8qZwAfGEOW6j022x+r8FzFp0f84PfPIt6
 ClS/3rKe4PRtki7G0Dbp/V1TZ4mx2b8Z5DGducAVc3R+tn7v0vm5xChJ/yYzqL2qD0hLkYu
 7CMj0sKB0YtkG78JVC5IuYhQOnvyeRjlBU60QytRaxKT7jj1SfvcG4damTuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C36941ABB
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 13:28:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C27F610E725
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 13:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75A8A44379;
	Thu,  8 Jan 2026 13:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF33C116C6;
	Thu,  8 Jan 2026 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767879385;
	bh=0FGDq4ThNIZ3VmojZf39gffqMCrh6VNHHpCJDOVvRSg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=mm2pmZQWIbCfgetyKxiOAsgncUxGThQNoZTFy5hO6i9SDmk4auYfIGEt9wGbpTpWN
	 L++Kiupb80K1NA55M4IepMMgs5K9mMclF4NegtLpyly30wvm8laazR84oVmAu22vj5
	 eV/tQnRr3UDBuamJYSGoeuR6n7Kbmhc3CB7G1GVi/y8m+eqqWpHyWGKtVlygkBABHD
	 bhP/HsYibS9AXf4VMYmWnKnB+pfKoBO6P5ysRCUPjeX180tJ+rIX815gc1nBuvV3PT
	 wKZEHLBoTOmNEhTamvF6OeWoGxcs6e38hFWW1QG/7PyXgioZVSRI+TyChoMHMnL9f2
	 HHSqOfQZujctg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 14:36:21 +0100
Message-Id: <DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several
 print strings
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
 <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
 <20260108125523.5c7810ae.gary@garyguo.net>
In-Reply-To: <20260108125523.5c7810ae.gary@garyguo.net>
Message-ID-Hash: JLTBJD3BHLBL2ZKLXYZTEIBB6TNKUPAG
X-Message-ID-Hash: JLTBJD3BHLBL2ZKLXYZTEIBB6TNKUPAG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JLTBJD3BHLBL2ZKLXYZTEIBB6TNKUPAG/>
Archived-At: 
 <https://lore.freedesktop.org/DFJ8XRR2T22T.3R4FQHF50B4P4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Greg, Rafael)

On Thu Jan 8, 2026 at 1:55 PM CET, Gary Guo wrote:
> In very early days (before RfL is upstreamed), I had a prototype print
> macro that is designed like this:
>
> 	info!("foo"); // pr_info("foo\n");
> 	info!(target: dev, "foo"); // dev_info(dev, "foo\n");
> 	info!(target: dev, once, "foo"); // dev_info_once(dev, "foo\n");
> 	info!(target: dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "fo=
o\n");
>
> There's a trait that is implemented for anything that can be used as a
> printing target.
>
> I still think this is superior than just having our macro mimicking the C
> side (and as a result, having a lot of macros rather than just one for
> each level).

Why do you think this syntax is superior?

One disadvantage for maintainers and reviewers would be that it is less
convinient to grep for pr_*() vs dev_*(), which is something that people
regularly get wrong. I.e. it regularly happens that people use pr_*() where=
 they
actually print in the context of a specific device.

> I think with Rust printing machinary, `pr_cont` is rarely useful, instead
> of calling `pr_info` followed by multiple `pr_cont`, you can just have a
> custom `Display` implementation and print it in one go. This is also free
> from racing against another print and have your lines broken into two
> parts.

This I fully agree with.

> I would be much in favour of vouching deleteing `pr_cont` entirely from
> Rust codebase and always have newlines automatically added.

I don't think it is a good idea to always add newlines. It might be fine if=
 you
only do C code or only do Rust code, but if you are switching back and fort=
h, it
is a horrible inconsistency for muscle memory.

I'm pretty sure that this would turn into a generator for trivial fixup pat=
ches
either removing or adding the trailing '\n'. :)

- Danilo
