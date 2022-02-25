Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034734C8284
	for <lists+nouveau@lfdr.de>; Tue,  1 Mar 2022 05:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4510EB8F;
	Tue,  1 Mar 2022 04:37:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44A10E852;
 Fri, 25 Feb 2022 17:14:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C0FC15C00ED;
 Fri, 25 Feb 2022 12:14:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 12:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=QAIE//4Id/0Y1c
 I6nnf9RdD1u5ph2t3iHwfIekVgRdA=; b=DW+BBCDjICGGGpJV1mqAPhnFseD9cn
 zzAI5sg8bfBfofwAC7TJ9PCKdyAAKOurmKIDGB90xd2FBOVP93IDMRdzcHYQI5Yu
 OO7ToiyI9vT5qSqOgeiZBJM/xivJO4wugTk9uhbMuK69hhvNY0gLSSbO9P+YmO2Z
 QzSrC7fgwI6zxqGVUPuNRFdGakiGeP9iYSpGsJ42SyFVMrnyKLiuvA7/V39y6ydd
 tOXKPrYK/yjoTIpg0VCmmgAEHboKPGb5HjjNoVp8hbTIo1NfEc/ggtP9y84QrpkX
 skl8aw9wGb3NLehOxBTp3Ncur1WBRjko20M6IbAZlZ4dAjJ190NCTz8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=QAIE//4Id/0Y1cI6nnf9RdD1u5ph2t3iHwfIekVgR
 dA=; b=oA0/1rKMQi+eJRQTlYNqs/JThhtmTswg1j+1njBrNIwp01OlyTNIEr9Zq
 z9vV4yTItPSDhnz05BVJYtKVXwaoIKFQjcJBfTurQqzDm/tzv0iW1ogp/QTr8p/Y
 KA8uYatCVj7uL3MEXf0YNidTZ1zCxhDsaqlrlcFwghp70eKyTzGEvL4pkTmBQN53
 ofeILHzrVF+me4PmnIGBM76HoJOuQgZ/z7vfbiT62mQBuWOpbgFFz3G5pPfiNkzP
 by1/Gwdq9qQGNYejlG4m5nwRI2iFXfn6clwy9yNqzkLMn0xNlGEId9orQ6/hwWmn
 H1zCnsM1jteN+RHQrByDUpk8pzWnA==
X-ME-Sender: <xms:jQ4ZYuGvyA-M87SxbyMyAAwfYKLo2JQ4TBUwoP-4HFNxr0n0spyhcg>
 <xme:jQ4ZYvUk2Y_sPXfIZ3052EwcD7cIns_yZbvOa3yD4vWM5fR-MUxy2R9PcBmVyMJnt
 YodIEXYDIkNKWEGv5c>
X-ME-Received: <xmr:jQ4ZYoIy5dXxtL-od_Ym2Giu0HWWxfukqqLOdng6VceZPHkxwFfnxHs8Qibj_Vkuuk5bNmka4Lav5eApNxjN6ugVO_Tqjbntke8ijzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jQ4ZYoG5so5hlbL7qhI7e3OUpUkMW3hq-EP4bCatuYPYPOtM7G3YSQ>
 <xmx:jQ4ZYkWm8nEaQ49u8NbcPM4Z-UC2PYy4ciNM1VWgwR97arAS2invEQ>
 <xmx:jQ4ZYrNlNSTN7BY5mTEsEiuf6XgqXwNVnzB-4x_6GNr-8EXv5_CR9g>
 <xmx:jQ4ZYoq_LfRF-CXpFnf4i3OCgPwV0rcYsDJKKndJSBOCzXASbP42SQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:14:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Date: Fri, 25 Feb 2022 18:14:39 +0100
Message-Id: <164580928297.726994.10617916823452738763.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-14-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Mar 2022 04:37:20 +0000
Subject: Re: [Nouveau] (subset) [PATCH v2 13/22] drm/nouveau/kms: Remove
 redundant zpos initialisation
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 nouveau@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:09 +0100, Maxime Ripard wrote:
> The nouveau KMS driver will call drm_plane_create_zpos_property() with
> an init value depending on the plane purpose.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in nv50_wndw_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
