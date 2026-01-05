Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D58CF4438
	for <lists+nouveau@lfdr.de>; Mon, 05 Jan 2026 16:00:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D05410E42D;
	Mon,  5 Jan 2026 15:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ceyc/DIZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6917E44C99;
	Mon,  5 Jan 2026 14:52:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767624759;
 b=Fv20jpp3VVBmAxA8f1ylepOrZhNsp3HeTFFCkBL0RD+fHDZMz8woqlbMovTqGU+WBztM/
 R6TZn1LgGJntDVb7PqyRyybVrkQ3gi7WSwnvm949DMCq4lOoPsL+OYQgMAzJyFGqFhOnkfy
 ulfPgydr5s+k+ug3srZb3Ey3XXFDKl9Sqf3xIXfmGZril8zhvOaugmknet8VulsSN5AArK+
 d/SfDE0k80w1cGspRogIygdpIyaMJARBUesJjcJXquAef5aDCJYNx1XiP/0k+v1Np4PgOf/
 /GsOExDNiqqGk6vuPzkyJetAqwaZm6XfGbg9M9zqRsGGlTMOsfpgg+NEUnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767624759; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RnV6AnHdoNFukndWQely2McwgXknlLiXc4k9719Ye3A=;
 b=Hw2FMQnqaeHvfoySfNpvjhoASFVOWyFOIG0b533G9gR2Da+WgQ6Y8LAOjER/8D56CqBn4
 kS2FLxGxS/MoKWBHwagG+e3tsEoyR+owjs4mlvQSuN+AyMRf/e6aNDM2NELwsoTVq58TxeG
 wfs7tmI0nS/rv8W6teJ+oTJPXn9uxNZPsb9XM6se+UKpH4PPaYUpU5utQDAC+h4TAo8CfYb
 NR9s92qKMtTzYWvXrgMN3Zhullip85goMbwklARYTcACe5bgtqyZzFg32pkIZh6CvI0V/ln
 dXpnI3no0KjuRGCMM5weZCtUX6vbwgcVI5MoYYtFa8pt+LtQAj1g05DS8OdQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0BD4744C93
	for <nouveau@lists.freedesktop.org>; Mon,  5 Jan 2026 14:52:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E527310E41E;
	Mon,  5 Jan 2026 15:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1919D6011E;
	Mon,  5 Jan 2026 15:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B3FC116D0;
	Mon,  5 Jan 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767625245;
	bh=7gg5z6C6yw3HptKGw75TFDN4ZG/aBRLGLWwhqPAD4qw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ceyc/DIZR5YXAjppuoL6w7w7HZopdRIgz+s2KWeiw3t7KHB9OFNAVY4pZ4dxaSoo1
	 kUsakpsv5hoTZ3+Ie91bdF3XP2T8Vo/flO6OrNdaKiVErMuZ87PO7BTpZI0KBLLPMH
	 r9C5NlQ07vUxlDFsnnqt4sPO6MI3vUzvKjXuN/lDRlq3VpdGb7ykydjji/fSNZmsZF
	 68jWpqQgPEkLF5X+zTwxfKnaMjS2xPAK94YBG1Mhm9OB8oL2I26UlAgTBQjO4Vu6D+
	 TywOtM9aHaAfGHmHAFi1/79K2ZEGQxj9xSzRd1/gauR/C2eACXh+sEOgWfgfscm1Vh
	 T6BvRfh9vMEUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 16:00:41 +0100
Message-Id: <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
In-Reply-To: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
Message-ID-Hash: D57QZHM4XZKBFL77723VPRIAM5F3RRRC
X-Message-ID-Hash: D57QZHM4XZKBFL77723VPRIAM5F3RRRC
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maurice Hieronymus <mhi@mailbox.org>, aliceryhl@google.com,
 acourbot@nvidia.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D57QZHM4XZKBFL77723VPRIAM5F3RRRC/>
Archived-At: 
 <https://lore.freedesktop.org/DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 5, 2026 at 3:42 PM CET, Benno Lossin wrote:
> I'm still skeptical about having a derive macro for `Display`. What
> about adding & deriving the following trait instead:
>
>     pub trait EnumVariantName {
>         fn variant_name(&self) -> &'static str;
>     }

With a derive macro for this trait, that sounds absolutely reasonable -- a
corresponding Display implementation becomes trivial with this.
