Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B005BDCF9
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 08:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48710E29E;
	Tue, 20 Sep 2022 06:15:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
 [IPv6:2001:67c:2050:0:465::103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9110E29E
 for <nouveau@lists.freedesktop.org>; Tue, 20 Sep 2022 06:15:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4MWrrL5nvnz9sTS;
 Tue, 20 Sep 2022 08:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1663654530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DC6Hx/+oy2DHbXkWg4hFJ6HCo5SiUWt7+0IEF/EtUE=;
 b=mGM9sp2BJk8/2TyNPHA1ZJ9rSz3e4Esz0YZL6d6Qf86eXlWlqz967BTrKyYI+hQNIBSWsy
 SYlDcDmaMqYHpCpTwFoPIYQL74+boIwSxTHhlvpZNQjIcn5k6B1fQJd7MIH2sd7O60gkHu
 zvQyG31wYae6ACbpdsNJJ6vvn/RCajXTOmZ+/63/E6do0qrwfVX1Vs/gvxrd7uGMm8/CY5
 /zHF3RAOa9L+v6hVCcMn2pH7Z4Y7Rqc8Xv5rOL6CDETSiOelfZ1kTo3PzYjLLOm7Et90e5
 qeoeKo1EIRmSB3rnY1pmHQsnK0mnTeQ0KG6NROYXZX7kt9vwTmun3JW2Azobzw==
Message-ID: <67c138e6-3f6c-bc57-d95f-3010749b53de@owenh.net>
Date: Tue, 20 Sep 2022 01:15:25 -0500
MIME-Version: 1.0
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
To: nouveau@lists.freedesktop.org
References: <615912a3d56e4330923d9b42802e8b09@di.ku.dk>
 <39dfb25d-2eff-23da-ada2-7d5de1f14861@owenh.net>
 <56ad0ca76d2942b8ab2ebe4f212b771d@di.ku.dk>
 <967f752c-3508-1151-d245-44f83c372826@owenh.net>
In-Reply-To: <967f752c-3508-1151-d245-44f83c372826@owenh.net>
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

On 2022-09-08 00:08, Owen T. Heisler wrote:
> You could open a new issue for the wiki (registration required) here:
> 
> https://gitlab.freedesktop.org/nouveau/wiki/-/issues/new
> 
> Or I can open an issue for you, using the body of your original message.


Hi Klaus,

I opened an issue and merge request with your suggested change. See 
<https://gitlab.freedesktop.org/nouveau/wiki/-/issues/12> and 
<https://gitlab.freedesktop.org/nouveau/wiki/-/merge_requests/25>.

You can preview the change at 
<https://owenh.pages.freedesktop.org/-/nouveau-wiki/-/jobs/28612539/artifacts/public/TroubleShooting.html#kernelmodesettingorxsetsabadornon-nativedisplaymode>.

If anyone can review this change, please do.

Thanks,
Owen
