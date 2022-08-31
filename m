Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A285A7488
	for <lists+nouveau@lfdr.de>; Wed, 31 Aug 2022 05:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B7E10E1A1;
	Wed, 31 Aug 2022 03:37:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA76F10E1A1
 for <nouveau@lists.freedesktop.org>; Wed, 31 Aug 2022 03:37:16 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4MHVGv50zTz9sSX;
 Wed, 31 Aug 2022 05:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1661917031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7W+sZnOuOECJWwvhoYf1S54YCB2usWWL+MyIBaCV4T4=;
 b=JoQ8DVCCh3myhjtDARL5eL91cbs3o33QtD06jffhHxvrz4pADU9uThm/UXHevU7dSyMdsf
 oFqwhZzLZKdBYM/sTJCJsAcIcc4e2oeIZ14oh/vKWZrKPFRud8yqPq3dYg8v7lRokKmZgP
 5kTPzy4p41ePq4+Z7Y6OmoKh9b5/rAua9NKTnEnfd01iJ17G/KtTC1iKWX+L0a6GoiecpQ
 bNrmSLPTeKQgK8SV0h4zN4tPt7pu+FGXpApQ51VssuLH5CU8kUnk6lj03fad8j3LqIXwvt
 RyE0+121icXObserEC1w/HYPMV/W0jfQsAwiNUegcF8RiPuTu6fQwoXTD0RDQQ==
Message-ID: <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
Date: Tue, 30 Aug 2022 22:37:07 -0500
MIME-Version: 1.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
References: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2022-08-28 05:23, Klaus Ebbe Grue wrote:
> Whoever is in charge of the web-pages, could I persuade you to make a 
> minor update of
> 
> https://nouveau.freedesktop.org/TroubleShooting.html 


Hi Klaus,

The edit buttons on the wiki link to the source repository on GitLab. I 
asked about developer access on 2022-08-05 and never received a reply:

https://lists.freedesktop.org/archives/nouveau/2022-August/040616.html

I haven't tried asking on IRC (#nouveau on OFTC).

(It looks like the <https://nouveau.freedesktop.org/InstallNouveau.html> 
page needs some updates too.)

Good luck,
Owen
