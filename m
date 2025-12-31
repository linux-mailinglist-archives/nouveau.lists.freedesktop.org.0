Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96303CEB02C
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 02:44:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 815F210E91E;
	Wed, 31 Dec 2025 01:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EnVgs4Qx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B921444C66;
	Wed, 31 Dec 2025 01:36:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767145017;
 b=bYkKgThiMqsWxu/Zrx/QSiqIkUPWA4Kt15zzmEjUsX3lEEijg/dpznYMOKQV5r+Kx4mwk
 JTmhiCBV4DpFzdOFZmZblyh6laptlW+28fk8+frhw+xMif7s71JzuzmCogJzwHnL/sC5u2C
 XCUDP7F8z5dtZuGYc5HA++67tfkfEqDfvXn0ShNEcs2a5Rp8HPk6awhIZLqpOT4Lo6xviid
 aOEovaatfzk3eUHB7Bsipu6jx1bSDNA2iCoWz8iELwYitBc5W5BeHNWu7ieXINuKk+AD8Be
 Rqe053bYCQ98CrQCr3uM7vyMnh//TeFWgbq+zAd4CzmbPxTHTK5fLXfpyIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767145017; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+kekd2j+0K3OqUgJbUsLjoOVXDKfpvYmOomqNxMnIzc=;
 b=u3Ta2LBAhJU9SZ6/mSGdU/t9RwxT6FBJYY1peCr+XeI1Ei/FX/SRCXX3Ufnf7nhH3P9Py
 VuF/vKAh17MUlb2X1pMlUygaaqGA8KvBB1yRCvqMIkFNEf6ZVMaGCBGLiUh2nhLFga4QUHQ
 +9g6VDqEV2boXZPF3zJYL3C7g/C8U+TgZzY7kFArIE+KRZcdMpwvBikPQn7yjzEMlghAigJ
 Fu1vNIYJgOhAnmgAluX59krYucOMg1aZXtfEDHjhFJD4YU1jFNZmr4OTAfH5YsLIzwCp07K
 snMXic5QXMsM8y32jIV28qWTs/3fTTO/F1+em1sZMEEpR/fbCZ0VkZt6NhOA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A476E41C6B
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 01:36:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1418B10E236
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 01:44:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04C6E60008;
	Wed, 31 Dec 2025 01:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B442C116C6;
	Wed, 31 Dec 2025 01:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767145492;
	bh=+kekd2j+0K3OqUgJbUsLjoOVXDKfpvYmOomqNxMnIzc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EnVgs4QxI0S2CmlVa/QBWP4oYvFS2mghqWDmTPji9j2L5B7vf7TMQI03xwgFuHLPr
	 dM2A7eEOenlgozdlWrnwC9Bymqz9lNb+688TYZJyM5hAHQ228AKEqRCOmgBiiP2VTv
	 xuf/e3WiAQe8YID3VAOr+ILXHDUzFZOftr5GRpsxozUYtOk/OqzVt11j9MBXoOHK/t
	 ZUx0699xXY3SfIUG0KGEW/zItRcqhw3V3DnGf8P2wNUbsqSu4tWagpSMDHTyjnKGsW
	 EXgw1r/Ok8CNr2ACLeCthy8rQX1D7Av2yJQJoCSCIIuAe9JzMnNt9TUt6+XamsuY+P
	 bOtzQiLtSUw4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 02:44:49 +0100
Message-Id: <DFC0SMRNXSCF.VFRFCASVMX5F@kernel.org>
Subject: Re: ba1b40ed0e34bab597fd90d4c4e9f7397f878c8f for 6.18.y
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: 
 <CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com>
In-Reply-To: 
 <CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com>
Message-ID-Hash: YDKMAB2DEZ7GWP2JKYOICYLWDIXMDVPE
X-Message-ID-Hash: YDKMAB2DEZ7GWP2JKYOICYLWDIXMDVPE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, stable@vger.kernel.org,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YDKMAB2DEZ7GWP2JKYOICYLWDIXMDVPE/>
Archived-At: 
 <https://lore.freedesktop.org/DFC0SMRNXSCF.VFRFCASVMX5F@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 31, 2025 at 1:57 AM CET, Miguel Ojeda wrote:
> Cc'ing Danilo and Alexandre so that they can confirm they agree.

Good catch! Greg, Sasha: Please consider this commit for stable.
