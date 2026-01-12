Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6483D1309F
	for <lists+nouveau@lfdr.de>; Mon, 12 Jan 2026 15:15:09 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A99A010E3E4;
	Mon, 12 Jan 2026 14:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LJ9Tc0pR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 009EA44CA9;
	Mon, 12 Jan 2026 14:06:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768226801;
 b=B1FlCvkE2UNmHyV2dsDIxijULE1EK9+3zskgwuUPS3xozru+EdNwysovUWkGZ9mGlrUIv
 ZqwlAZ+AS8j9Qq3n/YSPG3p91djdVd9OS8nVUocPrdNrxQyLVDjTFLhS9QP/dEUelMFuKib
 nJpJX66PByLxWRgF+YFvLRcLivkP6RLfZg86QalfGNlZ78tfgfkf9lnGL0QGOy8FtFu3BG6
 EU6n+uPVGBLCHBCHTa4Of8XYgogkXnaWK7ZknCnEt3LBG1c4/6F98sxSK0VAJDEKzHuoW/s
 UjgsvJZD9zYoeMGgXGhmWxtLQw3mb+nis+HyMd39pEpSWoimEWBNQWwgYwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768226801; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=beVLzk1VDgl0P03C9xNa2Zxpee4MTkpoN+wLVNVXSgk=;
 b=osze9wMAtjV/8aJj1bXatnm4j6cAoCkjNir68Lhtq5NlH/z0juSlittYecYsUnUP2Vane
 4n/yZ10gN9lm8gwCB66QqzJi7fOSDT8jl4zXAdJkVi+M5Pf0JafycWWfqVnCdmKiI84xd+/
 vz+Ott2pNtkwf+OgdgAK9Huc/XI3VXphhlCu0V7i3kOv/cAdgS2FXDsuigL2o3XMJpyJRmS
 SlH3ukBSM9SNUD43YpojkoP7njfs1l47AxzVgBW5XLSmYXtNsy3IKMNZpz/YJpcxNdvQKsa
 x4mXcQfmbQq3KR8DXpTu3t+wK91acLObAekf0vzA8PCw0xRb+gmvclKagy0w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D14B844C9E
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 14:06:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 328D610E3DE
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 14:15:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5452560007;
	Mon, 12 Jan 2026 14:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9981FC16AAE;
	Mon, 12 Jan 2026 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768227304;
	bh=beVLzk1VDgl0P03C9xNa2Zxpee4MTkpoN+wLVNVXSgk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=LJ9Tc0pRp71clQLbDENEklDKaT7K9u+5NSWlnoMeTdp2rVk+DU3QXfWErd382nHph
	 Ns6pmBE7BvmFbSP6OLfSOxyEwJy30nY20BGSchOGzZCECHLS3bEBHYySzSPnExDAhj
	 692UafkkioyDrB6Eyq4Oob5Jpa+fucVnUMOCnx01olsCFWGDpcTAXlZUQ1L9Qnkbvf
	 8GeX784zS5LU4ZMXcAwWpcoJm+y4SuXAxLbd7ufa4341N6v/z/TGCMM0uINSKxr7qS
	 E06XZ0SW9N0ocp//GhV4Z9XvKqUFVTdisqAYhei7v2hXw0Px6lu8lpjJR3xLraU9t4
	 4KIzoK0dYZ2ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 15:15:00 +0100
Message-Id: <DFMO9JVLR5FA.3DNRZH9NDE6X3@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
 <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
 <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
 <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>
In-Reply-To: <e15f1221-c146-4fe1-832b-201979b943ed@kernel.org>
Message-ID-Hash: CI5F4IICC3SQ7X44CIVFKH26JL2WHEEL
X-Message-ID-Hash: CI5F4IICC3SQ7X44CIVFKH26JL2WHEEL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CI5F4IICC3SQ7X44CIVFKH26JL2WHEEL/>
Archived-At: 
 <https://lore.freedesktop.org/DFMO9JVLR5FA.3DNRZH9NDE6X3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 9, 2026 at 12:22 AM CET, Danilo Krummrich wrote:
> On 1/9/26 12:12 AM, John Hubbard wrote:
>> Are you comfortable merging these two patches to drm-rust-next? I think
>> they are ready to go at this point.
>
> Yes, they are already on my apply list.

Applied to drm-rust-next, thanks!
