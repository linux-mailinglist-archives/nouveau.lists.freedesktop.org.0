Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B75E7186
	for <lists+nouveau@lfdr.de>; Fri, 23 Sep 2022 03:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6210E19E;
	Fri, 23 Sep 2022 01:44:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAFE10E17F
 for <nouveau@lists.freedesktop.org>; Fri, 23 Sep 2022 01:44:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4MYZgz4bw7z9scK;
 Fri, 23 Sep 2022 03:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1663897455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWAspFyihPE6PQ3mkLYru4EbXw7B4tfiNiXXa1wSFAc=;
 b=hTJ+mzDCvu6kppbsX20d1Rlo4mqgGRVPTQfNZ9Z6ZtuTmkPrPZPpgmd65Bw1D8IqKZvVds
 9yqCgvHLG8P2nW5NP4Y++67voeh6+7psolhoJgfEFoZN/gOpGenPhx6Ty6tdZcQ6jcl+JU
 CsQS5nrwKcplukBsV4b/a5RZIXT+TrTCbNXi6QUKhqCafGmChiSIAXbIrK1NtJuWDpmUzk
 iYRiMdSuRPuvarSnpoZp02VAErkURJUxF2pgYYqt3xtle/iJU5TX0/lYBd85dKNFy9gA1N
 fwFE4KgMX0qT1oR2LfA/EXb2Hoxt33/w4fMHo7kMWXIZg+1GPVbsC+lKvllaog==
Message-ID: <f210f689-bc6c-f00e-a401-4b9244468f2d@owenh.net>
Date: Thu, 22 Sep 2022 20:44:08 -0500
MIME-Version: 1.0
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
To: nouveau@lists.freedesktop.org
References: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
 <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
 <56ad0ca76d2942b8ab2ebe4f212b771d@di.ku.dk>
 <967f752c-3508-1151-d245-44f83c372826@owenh.net>
 <67c138e6-3f6c-bc57-d95f-3010749b53de@owenh.net>
In-Reply-To: <67c138e6-3f6c-bc57-d95f-3010749b53de@owenh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] Patch to TroubleShooting.html
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Klaus Ebbe Grue <grue@di.ku.dk>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2022-09-20 01:15, Owen T. Heisler wrote:
> I opened an issue and merge request with your suggested change. See 
> <https://gitlab.freedesktop.org/nouveau/wiki/-/issues/12> and 
> <https://gitlab.freedesktop.org/nouveau/wiki/-/merge_requests/25>.


Hi Klaus,

Karol Herbst merged your change and it's now live at 
<https://nouveau.freedesktop.org/TroubleShooting.html>. Thanks for 
reporting the problem and writing the updated text.

Owen
