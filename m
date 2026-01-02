Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FDCEE837
	for <lists+nouveau@lfdr.de>; Fri, 02 Jan 2026 13:23:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8E010E0FD;
	Fri,  2 Jan 2026 12:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cjHg8CuF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5420C44C81;
	Fri,  2 Jan 2026 12:15:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767356145;
 b=B+VBnvKxkHTgwzIk9l2BnwUJwgcuhMHji8curv3G1X4BBtsZvDp2zR9YQv5JCII9oxVFY
 3qgUoOgQrLRWcemnQUKvwiWO4KQRrtLEyKReDlrEQjXE0EyLGMthF+CQAoNzXrb/92PMrhe
 nBujqx4SfiHMM+uf+gWzV3+MFrhG5+ITp2aOXvP5HPt1W/8zcNyRPJV3ecf6sDf/hbLtNGL
 U7UY8aq8zMLqdBQLcIxCGFW4w4a7zroMEdp4SQa45hmYLxsqfc231C/SHruro3+f6Bq0IQj
 CRxNhwe5N2AuRdrRvkiGJbRRMad32FGd3n+r0ozQRGb9DFDtv5w0Cb4CyRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767356145; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KMWJTRq4S6jBo1AsyS037SQcO5tA3LB5Yt1+3jn8xQQ=;
 b=Q4vWUW8sVDQY7IuTpxj+iw0LiQtPHlhheLYMXPGLfy/UvMVLH71pR4W/ymBQc5hZNBK2v
 49xY6DBnewj/7+vH4oIqZWDXB1sDjcNYiFQKM6sepjyCAnksLk/r+gpTVPAwyNfgKhIDsbG
 teRBum1YN46q7iKoZvOmph9+RW/4GCKPrA5vjgfKTRmFoZXB6LoovhCcjEb3hxgD2uSsEi8
 ItXmgCJOTvTH7zQaCaEcmxBCAF+7PF0wA1MRastWQQdfSved09h2IZ/j0qQd96q46vnygKr
 4dBuK7xAQ/QjZjOUnXvOhhx3aDmgT0OfUEHMs/JHO10sh5mQcb2/06bGrJrg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linuxfoundation.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linuxfoundation.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linuxfoundation.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linuxfoundation.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0627444C45
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 12:15:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD5110E0EF
	for <nouveau@lists.freedesktop.org>; Fri,  2 Jan 2026 12:23:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7273E60017;
	Fri,  2 Jan 2026 12:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F45C116B1;
	Fri,  2 Jan 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767356624;
	bh=Il6vtJBmZFcHo7j9Qa1hq4r7IH6E3gpG1ZauhomDTgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjHg8CuFlrT/SwApaoVVvj4huM2y1EcH6SExr8Qyuns7xlWi5KZm2npIRQOBYhAHA
	 yMxuxhOfYKALFyTxnUM3sasXBSSQ0F+GyFZsb7Kuz1Jyt68FpQOtksFq2aKsRyfOIM
	 Rwh9J1CwNzwv/7QURXQokJ+QEVIx6h2wpKfmCMFM=
Date: Fri, 2 Jan 2026 13:23:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: ba1b40ed0e34bab597fd90d4c4e9f7397f878c8f for 6.18.y
Message-ID: <2026010235-spied-quote-cb42@gregkh>
References: 
 <CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com>
 <DFC0SMRNXSCF.VFRFCASVMX5F@kernel.org>
 <7737ff62-163b-45eb-857f-c9eb00ea2914@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7737ff62-163b-45eb-857f-c9eb00ea2914@nvidia.com>
Message-ID-Hash: ZOZVBLRXAMWITQRC4UMTR7F3EJQH6N7Z
X-Message-ID-Hash: ZOZVBLRXAMWITQRC4UMTR7F3EJQH6N7Z
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 stable@vger.kernel.org, Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZOZVBLRXAMWITQRC4UMTR7F3EJQH6N7Z/>
Archived-At: 
 <https://lore.freedesktop.org/2026010235-spied-quote-cb42@gregkh/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Dec 31, 2025 at 12:02:20PM -0800, John Hubbard wrote:
> On 12/30/25 5:44 PM, Danilo Krummrich wrote:
> > On Wed Dec 31, 2025 at 1:57 AM CET, Miguel Ojeda wrote:
> >> Cc'ing Danilo and Alexandre so that they can confirm they agree.
> > 
> > Good catch! Greg, Sasha: Please consider this commit for stable.
> 
> Alex is away, but I also agree with this.

Now queued up, thanks.

greg k-h
