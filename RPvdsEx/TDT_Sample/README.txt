TDT System3 �p�v���O�����Q		2004/3/8	Ca++

-----------------------------------------------------------------------
ABR.rpx
	�����]�������p�h�������v���O�����iBRC���삳���j

AEP.rpd
	���o�U�������p�h�������v���O����
	2004/3/23	AEP.rpd��rpx�ɕϊ�

ButtonOLD.rpd
	�{�^�������ɂ����LED�𔭌�������iDout���o���j�v���O����
	�`���^�����O�H�������Ęb�ɂȂ�Ȃ�

Button.rpx
	�{�^��������Dout���o���v���O����

LED.rpd
	�����I��LED�𔭌�������iDout���o���j�v���O����

SimpleTone.rpd
	�������񐶐��v���O����

MMN.rpx
	MMN�p�h�������v���O����
	2004/2/23

4randTone.rpx
	4��ނ̎��g���̉��������_���ȏ����Œ掦
	2004/3/8

stream1.rpx
	�X�g���[���m�o�̎h���掦�v���O����
	2004/3/8

stream2.rpx
	�X�g���[���m�o�̎h���掦�v���O����
	�����C�ቹ�̃X�g���[���̒��S���g�����������ŕω�������
	�S�̂̉��̕��ρFCenterF(1000Hz)
	�X�g���[���̒��S���g���̕��z���S��CenterF�Ƃ̔䗦�C�ω��̎��g���FRatio(2.0)�CFcenter(0.05Hz)
	�X�g���[�����̉��̕ω����FVariance(0.05)
	�Ƃ���ƁC
	�����C�ቹ�X�g���[���̒��S���g���FCenterH, CenterL
	���ۂɔ������鉹�̎��g���Ff
	�͈ȉ��̎��ŎZ�o���Ă���D
	CenterH = CenterF�ratioH
	CenterL = CenterF�ratioL
	f = Center�(1+rand(Variance))  (Center�͉��ɂ����CenterH�܂���CenterL)
	�A���C
	ratioH = Fcenter�(range�sin(2�ΥFcenter�t) + (1.0+range))
	ratioL = 1/ratioH
	range = 0.5(Ratio-1)
	rand(x)��[-x, x]�̋[�����F����
	2004/3/8

	ratioH�̈ʑ�����4�ی������1�ی��ɓ���Ƃ��ɁC1000ms�̃g���K(1)���o�͂���悤�ɂ����D
	�g���K�̂��ƁC�X�g���[���͕������C�Z�����Ď��g��Fcenter[Hz]�Ō��ɖ߂�D
	2004/3/15
	

TiitinenMMN.rpx
	�����ł��ꂼ��W���h���Ɠ��َh����掦����
	Tiitinen et al. 1994
	2004/3/8

randSOA-MMN.rpx
	MMN�v�h�������v���O����
	MMN.rpx �����ρDSOA�������_���ɂ���D
	2004/3/8	

MMN_TadoEx3.rpx
	�c�������R�p�v���O����
	2004/3/23	�u�v�E�C���v�t�H���_�ɂ�����MMN_TadoEx3.rpd���C��


-----------------------------------------------------------------------
�t�H���_�u�v�E�C���v
�����̃t�H���_�ȉ��̂��̂́C�C����Ɏg�����ƁD
-----------------------------------------------------------------------
MMN.rpd
	MMN�p�h�������v���O����

MMNorg.rpd
	MMN.rpd�̃V���v���Ȃ���

MMN_AraiEx1.rpd
	�r������P�p�v���O����

MMN_AraiEx2.rpd
	�r������Q�p�v���O����

MMN_TadoEx2.rpd
	�c�������Q�p�v���O�����i�c���̎����P�͍r������Q�̕⊮�����j

P300.rpx
	P300�U���v���O����

-----------------------------------------------------------------------
�t�H���_�uBox�v
-----------------------------------------------------------------------
BUGGYstream.rpx
	stream1.rpx �̑O�i�K�̖����ŁD
	���x�� "tone on" �� Latch [32,0] �ɂȂ��ƁC������D
	�o�O�ł͂Ȃ��낤���H
	���ǂ� stream1.rpx �Œ��g���V���v���ɂł����̂ŁC
	���u���Ă������Ƃ����΂������ǁD�D�D


