Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA306E36B8
	for <lists+nouveau@lfdr.de>; Sun, 16 Apr 2023 11:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB34710E2F0;
	Sun, 16 Apr 2023 09:43:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F9E10E2F0
 for <nouveau@lists.freedesktop.org>; Sun, 16 Apr 2023 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638210; i=markus.elfring@web.de;
 bh=taXUqh59A6s5jLK2AMqvzxLyUAQof+foOlZbJMHpMq8=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=oR1aBvnwe/BN/rPG5Zkcb5wAhq4DMnmC9wNp3KNGdr7WHZYF4vRbKqVkRX2+2NuuY
 hMWRXm6hFrxSg9NinKW6uhrtZGkh1RTunXs6ndMmlMqTVTnVHXNt7q11A3uOFeZtPb
 PSk3/IL75+rzOCqZiQJroD+hIo+Cj86p5RaQZj1ZpB+acVqYvM+A8vNoxDX7kBwLus
 HNm2/0yRjQH3pklpBILXb2pIITiCjq6YA9r0vVXKagp/MnM6uzDdpG6PIW6FvsPmkY
 QOPjMebyhufw7ZcdHgj6afFjQUw1S7B/waWtnZVUTc7EVi+f5qhpKTsyKm6sJX74Ct
 1oo7n9/wUh9QQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLARS-1q4xdN0mZ8-00IAk1; Sun, 16
 Apr 2023 11:30:31 +0200
Message-ID: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Date: Sun, 16 Apr 2023 11:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iw+v+aCnrNtx+5y/6kxjkN4Kl9V8fZd2CmNmbqSHjI8zITy1Dor
 mtT4EPmX04v67L/2/64dI2v9e304IcgaVfVslHTvtnl9ifXrlbphIXi+qVRda/UUCGKRLb4
 Dv81299GNFZMUAqzqwVIiR9pOeRdpk0+qqY9WtkH0E0yV0HEZvKpdofwKlUPV1700fVGAbb
 09ujBRsH5FoaJkta6rswQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZE4ZfEO7EDg=;x5L5c+MZr2yi8kk8j3pmt7kByW0
 SW7LEFEMoqtgBwx9bW+7bXyTalD9WaN5RiulVHzTv27ufL3nMaSt3RbQ/Qpetv1qPPnikmUfK
 UZqvfVvtpSlYZm5JfFD6z6AHln0zjWQ18hmYVaS+AVjwFksU0gGvcauW406yM6NTswFQpcfQk
 aHvrJInM654M7Dl7PcASkldvNLRkh0TDroWpknjphpWIKatiLpdBFDtbWAzhJKh0P5W2gRHzs
 SJ6Uks4hsrRsoxQ0KpoPK72H2UIyn/57DuswV/Ie2G3A7n+p7siamUwM5ixBcAsUtSIH74zqZ
 s7T06juNtIEwOaGwL4SAqhNrCwlwKwjtaQjaux2ZXeRGkmAoTFPUi3cOjMdsgy2l1LeMHPLfx
 m7cIdywPUZjcXF4N9WysgYKqpX75m3J1FYcYCjco/UB21ijbd8HhnF7n6X4RPtrVtH+rFVxaz
 gePmaJH+z+AgvJa9zYND+675pEo/l80SauDmJ8XWehI6c3vfDFywhP2KLbjGWw56dePRuCfxT
 pA6aTKJfa4wTQ6ch5946bcCue4+tHF/3RayY7o8Ns24TzUlvvbfcZWui+38V74M177Y7LxZKY
 5uDKPuaK786hmks6yDfj1H5KMoGteCtRYGFC4kzoMMPzqbOEKDXTM6qYBa0l/kyDXSefPQ7WJ
 jurAm90A3QOCwtGHSw6JnRJNGFL+KNDkpKfAcxY05TVLnHzSby778O9flMlMmhunVbCp1RvjV
 YLbqEkeHc41FPHqjYbiy7AB1MoR/YQOvNZx2F0vnDBrn9YiYX2rtEUD8gveOJKgv7dRzxeOhD
 tzaWujl+IIUYs64nsfz15z0WbAqv4T1g8YEeOuFixIFvkwe1h1avI7Tz8BYO8ElibeR5Kux/q
 tYeCZnPGbSHvgG8mNkJntgkyGX/Oy+Sz4mJivqY5N5NnoSZyggfNd1dHg
Subject: [Nouveau] [PATCH 0/9] GPU-DRM-nouveau: Adjustments for seven
 function implementations
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Date: Sun, 16 Apr 2023 11:22:23 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  debugfs: Move an expression into a function call parameter
    in nouveau_debugfs_pstate_set()
  debugfs: Move a variable assignment behind a null pointer check
    in nouveau_debugfs_pstate_get()
  debugfs: Use seq_putc()
    in nouveau_debugfs_pstate_get()
  debugfs: Replace five seq_printf() calls by seq_puts()
    in nouveau_debugfs_pstate_get()
  power_budget: Move an expression into a macro call parameter
    in nvbios_power_budget_header()
  clk: Move a variable assignment behind a null pointer check
    in nvkm_pstate_new()
  pci: Move a variable assignment behind condition checks
    in nvkm_pcie_set_link()
  pci: Move an expression into a function call parameter
    in nvkm_pcie_set_link()
  therm: Move an assignment statement behind a null pointer check
    in two functions

 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 19 ++++++++++---------
 .../nouveau/nvkm/subdev/bios/power_budget.c   |  3 +--
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/pcie.c    |  7 +++----
 .../drm/nouveau/nvkm/subdev/therm/fanpwm.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/therm/fantog.c    |  2 +-
 6 files changed, 17 insertions(+), 18 deletions(-)

=2D-
2.40.0

