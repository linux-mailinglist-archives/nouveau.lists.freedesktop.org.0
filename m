Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31360599373
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 05:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1DC10E484;
	Fri, 19 Aug 2022 03:31:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4910E484
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 03:30:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4M86jB4vtvz9sjc;
 Fri, 19 Aug 2022 05:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1660879854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPhtOO1tJkW18ffvdcEBw7dZB7wpo3hME5zu0E96rT4=;
 b=ulg2G8y1yIsgRrQTZRFWKnEIrkCoTbq+10X14XZwS6vBq6Xoi96W9k7ox6CnRQd9dYzODC
 Bf24HXXoA6QfLLnfO4Beqbp5gK1CPdP/vuad2KZjLD86n2dLhXnChpo+bgLCL8S3JcbyRO
 ugFIY2kSktsLLPRi7fnm4ZmOD/5NqZlmMLPX0seruw1cAVjsREkZRQKr+9Kz1bSS4WlbqK
 ULlQGcwkwnsfcR81EROrsHYO+1tW1d/eJitsBm+jfeF0xjL/1Ypt6TeAqSylTlI7FpTYu8
 SRa12p5i1AMwZ+Is+2AMY3Z7N84eANTO9gUfsOpx84wMTq/EuEzB0Dbks/wsTg==
Message-ID: <dfeb020b-ce01-5721-3aa3-8b9220c0ecb3@owenh.net>
Date: Thu, 18 Aug 2022 22:30:48 -0500
MIME-Version: 1.0
Content-Language: en-US
To: nouveau@lists.freedesktop.org
References: <459852889.305460.1660845770242.ref@mail.yahoo.com>
 <459852889.305460.1660845770242@mail.yahoo.com>
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <459852889.305460.1660845770242@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] Ubuntu 22.04 LTS system freezes 5 minutes then
 unlocks on nouveau, was stable on 20.04 w/nvidia
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
Cc: "David G. Pickett" <DavidGPickett@comcast.net>,
 "David G. Pickett" <dgpickett@aol.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2022-08-18 13:02, David G. Pickett wrote:
> How can I help you find the bug?  Being both a 20 year hardware and 25 
> year software computer veteran, I can follow requests pretty well.

Hi David!

Please read the Bugs page on the wiki:

<https://nouveau.freedesktop.org/Bugs.html>

There are details there (and on linked pages) about how to report a bug. 
Since your problem does not seem to be related to 3D acceleration, you 
need to register and report your bug on the freedesktop.org GitLab instance:

<https://gitlab.freedesktop.org/drm/nouveau/-/issues/>

Please note, I am not a nouveau developer; I'm just trying to help.

Owen
