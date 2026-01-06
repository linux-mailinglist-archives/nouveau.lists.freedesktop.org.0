Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A07CF8650
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 13:56:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1137910E507;
	Tue,  6 Jan 2026 12:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kFxA1Exw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D64DA44C9B;
	Tue,  6 Jan 2026 12:48:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767703684;
 b=0Sx80FkPm028tQpz66DfPvfwo361jpEr7ccMZ9ChGkPdM32jskz+BeQmcS5J8ihHy3c9D
 KCzghOgprzaygwRPwtymNTVUOSIRXWQvzHryPgW6aWseNhzCy3bPtDuM8D/JY8S2nu8mub4
 QlAcyurKCWp7IkUy09MJzxvivzTP/igoIegEikt4GBcfg9b0fGyFNQaEq+jdgUXkGeGDm5x
 YdPcynqtXW1DozfrErUajKu3nv1WdPOdnWtL3hxBXgfrppmmPSfyFHo1Uh0ke095Nva2pUa
 BND3l4+FsmmqLNPVVQ2UBClMfGW6R9cVMf61LRZRH1SE0rzN0EcpPyAvgSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767703684; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r48+kBVXIaj5WBGqyEyie4xzCOgq/bpfJGXpiQuLkmI=;
 b=AKFODrGslAFdkz3aeeCUYyyrwBj9IbyPysrqB8Bwy6dJG72GWXxHKLVK9xSYMlkSDKheL
 Xpe4PAZp6qMrxmXNG/5piMpDfmx6GemST+0Z7geACarr2hB3yHpn47diXsZLbQg50/9hY7s
 6fmCrl4YEdf+xqw9d5dYjkJfqfbG1OvRw6l87lnoxQHpjdnJoaBnj05wKVrlONWx/Q0xdbR
 7kmpxPFwtU270CVDtKrQY1s3+WYLwJX316xi++CvZQ14vzmSkKo3uJWtUAsBFxuh+R7faYs
 +tj1kM9uGB3McaV9L3kbeOczjPBQPNlZDgbhEiR1647kXmAt1KfZcOeZOKyw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 74B3944C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 12:48:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7710E3A2;
	Tue,  6 Jan 2026 12:56:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25AD64389E;
	Tue,  6 Jan 2026 12:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF333C116C6;
	Tue,  6 Jan 2026 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767704174;
	bh=sWtryoRLOPWT/n5m9Ko/0M389f3WZbdEwizETVLZoPU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=kFxA1ExwcPNw3IMSn2w193OfntXYYyMSr0GwCLycNwWYfb5vqfHqWQ5QjMAGJjR+5
	 u2GooWBFoCibpcmx4lU24poJSS/skuiTv37yCrFLPgXjg6o9X3ApdLj85lkVowjOKE
	 Zr9ti6o9kJUbI4AnBpIrVmhNfX2QrmUPLXdXLVwoH8V8hZdu4S9rez6jl1kYSUl+4J
	 wBWhOQ3vksXlfCcF+onw60g78azpOLAl1CP/Rb/dgTwO7WqYjkluCfGGKdU06KIQw5
	 sO4caRN+tnDbTk7N84CRz+48nLyitpZdpu9qbQBM+xTgDe8MFdmcbTbsBJMbHwJl6l
	 eXI//XxsrhCbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:56:09 +0100
Message-Id: <DFHITWGSEB4E.QV5DTPS816XI@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
 <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
 <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
In-Reply-To: <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
Message-ID-Hash: 7FFAAHUJYQOJY7ZTF6DXX7J6VSM6WXJV
X-Message-ID-Hash: 7FFAAHUJYQOJY7ZTF6DXX7J6VSM6WXJV
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, aliceryhl@google.com, acourbot@nvidia.com,
 simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7FFAAHUJYQOJY7ZTF6DXX7J6VSM6WXJV/>
Archived-At: 
 <https://lore.freedesktop.org/DFHITWGSEB4E.QV5DTPS816XI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 6, 2026 at 6:56 AM CET, Maurice Hieronymus wrote:
> On Mon, 2026-01-05 at 23:03 +0100, Danilo Krummrich wrote:
>> On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
>> > Before I start implementing, I want to reach common ground.
>> >=20
>> > In my opinion a derive macro which implements Display would be
>> > perfectly fine, as long as the name suggests what it does. So for
>> > example #[derive(DisplayEnumVariant)]. This would communicate the
>> > intent clearly to the user.
>> >=20
>> > Benno, would you be okay with that? If not, Gary and Danilo, are

I'd prefer if we stay a bit more cautious about directly deriving
`Display`. The trait with the variant name sounds like a very sensible
idea.

We can talk about this in the team in our weekly meeting, they might
change my mind :)

>> > you
>> > fine with the proposed trait implementation (e.g. the variant_name
>> > function)?
>>=20
>> Actually, it might even be reasonable to have both. In the Nova
>> driver we have
>> the case that we want to print the enum variant exactly as it is
>> defined in the
>> code and a lowercase version of the enum variant.
>>=20
>> > Are there any common use-cases where one wants to change the case
>> > of
>> > the enum variants? If not, I would not implement an argument and
>> > rather
>> > name the macro accordingly, so the intent is clear.
>>=20
>> As mentioned above, we do have a case in Nova where we also want a
>> lowercase
>> representation to construct a firmware path with.
>
> So there would be the need to have two derive macros:
>
> 1. #[derive(DisplayEnumVariant)]
> Implements Display for all enum variants as they are (original case).
>
> 2. #[derive(ImplementVariantName(Case::Lowercase))]
> Implements the mentioned trait. Case could be an Enum where one could
> choose between Case::Lowercase and Case::Original.

You'll need to use a helper attribute, something like:

    #[derive(VariantName)]
    #[variant_name(case =3D "lowercase")]

Cheers,
Benno
