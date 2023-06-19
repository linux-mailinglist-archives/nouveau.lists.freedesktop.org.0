Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E97358D7
	for <lists+nouveau@lfdr.de>; Mon, 19 Jun 2023 15:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07FF10E20F;
	Mon, 19 Jun 2023 13:43:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4D310E200;
 Mon, 19 Jun 2023 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G21UfM6A11SwSxvpHKE3gLePL0xC/fN+iv9J6MaBAIM=; b=K0k+f7GlGtXd16Q1rTyJy7kA7f
 drm2wd12XkYl6vAnU2aHtD8wZQ3XMTpt7IWHQP/1DwNRo/pLURiAGq2Ujh/IP5wfDjRdSOR2l5Wv3
 63PknZcZatfrsd5r97JaUMgkXwQTKUOEo7Pc1OURStohqGC8aj+JOWO15KHGh5PBAGwVSZ36u0oRL
 X3ncWu4kjMEP8wOQt6FHCAyYBt62UwBAsHT88mSFiKuoxB7gFpaScFXz5zJw6XSeAJVNISrYWpkpM
 M3uuCFtqczben1iEm6j3iuBUNaC+WwXG5z1PcGoz5u+7K2lKSSvbgQMlNkjyB6wd1jfdhpB4tpxMO
 VZseo8yQ==;
Received: from 145.red-83-52-114.dynamicip.rima-tde.net ([83.52.114.145]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qBFAM-0009c4-0L; Mon, 19 Jun 2023 15:43:34 +0200
Message-ID: <086c491482404be792c72798f5fc840cc5625715.camel@igalia.com>
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev <libre-soc-dev@lists.libre-soc.org>
Date: Mon, 19 Jun 2023 15:43:33 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: [Nouveau] Requests For Proposals for hosting XDC 2024 are now open
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
Cc: board@foundation.x.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2024. Since XDC
2023 is being held in Europe this year, we've decided to host in North
America. However, the board is open to other locations, especially if
there's an interesting co-location with another conference.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible
dates along with estimated costs. Proposals can be submitted to board
at foundation.x.org until the deadline of *September 17th, 2023*.=20

Additionally, an quirk early heads-up to the board if you're
considering hosting would be appreciated, in case we need to adjust the
schedule a bit. Also, earlier is better since there generally will be a
bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.

Thanks,
Ricardo Garcia, on behalf of X.Org
