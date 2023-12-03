Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F280267E
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 20:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F2210E034;
	Sun,  3 Dec 2023 19:04:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-o90.zoho.com (sender4-pp-o90.zoho.com
 [136.143.188.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0810E034
 for <nouveau@lists.freedesktop.org>; Sun,  3 Dec 2023 19:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1701630259; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TB7oS2KWeD8fvYXfedQrXKdxGk/RCarx53DahNrs/07SxbQ5/GLUbNTxB9zKOBHMFRX0wNlt6XgcRP/TpU8RqjklVvKrTLo8lz6wgYCzQixXxK/ZW7pfAT7p5pagbWttkELZ2wqL60jBtUMp4rW5Z3v8aU+VdBwfhaFascbOnRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1701630259;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=xC4n2VmQzZedhQdl4nDZGrESJImIFD3hCAiBWMdNLno=; 
 b=CUSDLnW3SmjBzSNVQyDA0DEVxUcm6sKfRP5VW5pYquzNqajeElrAwA9I2xVJ/QoqkqTHFuE7lwE/uV1zGV3SAjBuxYVQKnNvhOmXifwL9m9NzccHB7MO2BnuXUt1cJISkvB38EtrL9jtKPBiKaPkvmraE7K3iipZYNu2GSeZf1E=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=dufresnep@zoho.com;
 dmarc=pass header.from=<dufresnep@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701630259; 
 s=zm2022; d=zoho.com; i=dufresnep@zoho.com;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
 bh=xC4n2VmQzZedhQdl4nDZGrESJImIFD3hCAiBWMdNLno=;
 b=KvP9SVLp7Hfn9rPaOcxBfRtUxkzQXzYcJ3bY+AlOl98BC9PKtfFPDzjmhNRUpiCh
 2Xb6XsPxwd6qKE+OJD+Oykum121Qk05Rx/YIlWWba4xVBBznVEQeMWBPxbm/oyUKaZc
 4odO26TnlY+z/X8YS2gXOdzoL0b5FnoNHAcQDB24=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 17016302524691022.4740106589879;
 Sun, 3 Dec 2023 11:04:12 -0800 (PST)
Received: from  [66.129.153.16] by mail.zoho.com
 with HTTP;Sun, 3 Dec 2023 11:04:12 -0800 (PST)
Date: Sun, 03 Dec 2023 14:04:12 -0500
From: Paul Dufresne <dufresnep@zoho.com>
To: "nouveau" <nouveau@lists.freedesktop.org>
Message-ID: <18c311115a3.b63b522e4445.755018207880528406@zoho.com>
In-Reply-To: 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112281ec818654e073c220b2699ff0000eed200877de412202b5b60ab989104fe2f2310f0dddae1120901:zu0801122762037a569480663dcc86dd4d00007cfb97efc595d32a4452d496584063c09ee317e66e79ad9ffd:rf080112328ff2b40d0d00e7d28368efad0000ddcc8b0d5e0a6fe8ec8ad88f777d03bf124969f20bf2205ad6ed3ab1086e8941e8e5ebd9:ZohoMail
Subject: [Nouveau] Meaning of the engines in paramaters of nouveau module
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

In https://nouveau.freedesktop.org/KernelModuleParameters.html, there is:
Here is a list of engines:
    DEVICE
    DMAOBJ
    PBSP
    PCE0
    PCE1
    PCE2
    PCRYPT
    PDISP
    PFIFO
    PGRAPH
    PMPEG
    PPM
    PPPP
    PVP
    SW
Also, in debug:
   CLIENT

I have tried to find a description of those.
https://envytools.readthedocs.io/en/latest/
help a bit, but I don't find a precise correlation.

https://nouveau.freedesktop.org/NouveauTerms.html
does not seems to have most of these terms.

I am particularly curious about PCE[0-3].
But also about CLIENT, that seems different and mysterious.

I wonder if it is possible to write:
nouveau.debug=info,PDISP=debug
to have the info debug level as the default, but for PDISP have the debug level

Also, my interest is linked to the state of GPU graph given after a context switch timeout that looks like:
[ 1696.780305] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 1696.780361] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6 
[ 1696.780422] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 00050005: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5 
[ 1696.780476] nouveau 0000:01:00.0: fifo:000004:04[     ce0]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0 
[ 1696.780529] nouveau 0000:01:00.0: fifo:000001:01[  mspdec]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0 
[ 1696.780581] nouveau 0000:01:00.0: fifo:000002:02[   msppp]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0 
[ 1696.780633] nouveau 0000:01:00.0: fifo:000003:03[   msvld]: 00000000: busy 0 faulted 0 chsw 0 save 0 load 0 chid 0 -> chid 0 
[ 1696.780689] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6 
[ 1696.780744] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 8006e005: busy 1 faulted 0 chsw 1 save 1 load 1 chid 5*-> chid 6 
[ 1696.780795] nouveau 0000:01:00.0: fifo:000000:00[      gr]: triggering mmu fault on 0x00
[ 1696.780835] nouveau 0000:01:00.0: fifo:000000:07[     ce2]: 00050005: busy 0 faulted 0 chsw 0 save 0 load 0 chid 5 -> chid 5 
[ 1696.780942] nouveau 0000:01:00.0: fifo:000000:00[      gr]: 00000100: mmu fault triggered
[ 1696.780987] nouveau 0000:01:00.0: fifo:000000:00[      gr]: c006e005: busy 1 faulted 1 chsw 1 save 1 load 1 chid 5*-> chid 6 
[ 1696.781040] nouveau 0000:01:00.0: fifo:000000:0005:[Renderer[13701]] rc scheduled

where I suspect ce2, is linked to PCE2.

Is there a documentation that describes those "engines"?
